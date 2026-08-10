local M = {}

-- Scan &directory for *.swp files, splitting them into "dead" (owning
-- process no longer running -> safe to clean) and "live" (still owned).
local function scan_swaps()
  local swapdir = vim.fn.expand(vim.opt.directory:get()[1] or "")
  swapdir = swapdir:gsub("//$", "/")

  local dead, live = {}, {}

  for _, f in ipairs(vim.fn.glob(swapdir .. "*.swp", true, true)) do
    local info = vim.fn.swapinfo(f)
    local pid = info.pid

    local alive = pid and pid > 0 and os.execute("kill -0 " .. pid .. " 2>/dev/null")

    if alive then
      table.insert(live, { file = f, info = info })
    else
      table.insert(dead, { file = f, info = info })
    end
  end

  return dead, live
end

-- Delete swap files under &directory whose owning process is no longer alive.
-- Leaves swaps for genuinely-open sessions untouched.
function M.clean_swaps()
  local dead, live = scan_swaps()

  local removed = 0
  for _, entry in ipairs(dead) do
    if vim.fn.delete(entry.file) == 0 then
      removed = removed + 1
    else
      vim.notify("CleanSwaps: failed to delete " .. entry.file, vim.log.levels.WARN)
    end
  end

  vim.notify(string.format("CleanSwaps: removed %d dead swap(s), kept %d live", removed, #live))
end

-- Report what CleanSwaps would remove, without touching anything.
function M.list_swaps()
  local dead, live = scan_swaps()

  if #dead == 0 and #live == 0 then
    vim.notify("SwapList: no swap files found")
    return
  end

  local lines = {}
  local function describe(entry, label)
    local info = entry.info
    table.insert(
      lines,
      string.format(
        "[%s] %s  (fname=%s pid=%s user=%s host=%s mtime=%s)",
        label,
        entry.file,
        info.fname or "?",
        tostring(info.pid),
        info.user or "?",
        info.host or "?",
        info.mtime and os.date("%Y-%m-%d %H:%M:%S", info.mtime) or "?"
      )
    )
  end

  for _, entry in ipairs(dead) do
    describe(entry, "dead")
  end
  for _, entry in ipairs(live) do
    describe(entry, "live")
  end

  vim.notify(
    string.format("SwapList: %d dead (cleanable), %d live\n%s", #dead, #live, table.concat(lines, "\n"))
  )
end

return M
