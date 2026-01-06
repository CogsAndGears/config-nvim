local M = {}

local function trim(s)
  return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

function M.split_ts_import_line()
  local lnum = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_buf_get_lines(0, lnum - 1, lnum, false)[1]

  -- Match: import { ... } from "...";
  -- Captures: items inside braces, and everything after `from`
  local items, frompart = line:match("^%s*import%s*{%s*(.-)%s*}%s*from%s*(.+)$")
  if not items or not frompart then
    vim.notify("SplitTS: not a one-line named import", vim.log.levels.INFO)
    return
  end

  local parts = {}
  for part in items:gmatch("([^,]+)") do
    part = trim(part)
    if part ~= "" then
      table.insert(parts, part)
    end
  end

  local out = { "import {" }
  for _, p in ipairs(parts) do
    table.insert(out, "  " .. p .. ",")
  end
  table.insert(out, "} from " .. frompart)

  vim.api.nvim_buf_set_lines(0, lnum - 1, lnum, false, out)
end

return M

