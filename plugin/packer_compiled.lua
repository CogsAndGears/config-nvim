-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/cogs/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/cogs/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/cogs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/cogs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/cogs/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n�\5\0\0\a\0\"\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0026\3\n\0009\3\v\0039\3\f\3'\5\r\0B\3\2\2=\3\14\0024\3\3\0005\4\17\0005\5\16\0005\6\15\0>\6\1\5=\5\18\4>\4\1\0035\4\20\0005\5\19\0=\5\18\4>\4\2\3=\3\21\0025\3\22\0005\4\23\0=\4\5\3=\3\24\0025\3\25\0005\4\27\0005\5\26\0=\5\28\4=\4\t\3=\3\29\0025\3\30\0=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\vrender\1\0\1\20max_value_lines\3d\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\1\vborder\vsingle\rcontrols\1\0\b\14step_into\b\rstep_out\b\tplay\b\14step_back\b\npause\b\rrun_last\b↻\14step_over\b\14terminate\b□\1\0\1\felement\trepl\flayouts\1\0\2\rposition\vbottom\tsize\4\0����\3\1\3\0\0\trepl\fconsole\relements\1\0\2\rposition\tleft\tsize\3(\1\5\0\0\0\16breakpoints\vstacks\fwatches\1\0\2\tsize\t0.25\aid\vscopes\17expand_lines\rnvim-0.7\bhas\afn\bvim\rmappings\vexpand\1\0\5\tedit\6e\topen\6o\trepl\6r\vtoggle\6t\vremove\6d\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\3\rexpanded\b\18current_frame\b\14collapsed\b\nsetup\ndapui\frequire\0" },
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/cogs/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\n�\5\0\0\a\0\"\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\0026\3\n\0009\3\v\0039\3\f\3'\5\r\0B\3\2\2=\3\14\0024\3\3\0005\4\17\0005\5\16\0005\6\15\0>\6\1\5=\5\18\4>\4\1\0035\4\20\0005\5\19\0=\5\18\4>\4\2\3=\3\21\0025\3\22\0005\4\23\0=\4\5\3=\3\24\0025\3\25\0005\4\27\0005\5\26\0=\5\28\4=\4\t\3=\3\29\0025\3\30\0=\3\31\0025\3 \0=\3!\2B\0\2\1K\0\1\0\vrender\1\0\1\20max_value_lines\3d\fwindows\1\0\1\vindent\3\1\rfloating\nclose\1\0\0\1\3\0\0\6q\n<Esc>\1\0\1\vborder\vsingle\rcontrols\1\0\b\14step_into\b\rstep_out\b\tplay\b\14step_back\b\npause\b\rrun_last\b↻\14step_over\b\14terminate\b□\1\0\1\felement\trepl\flayouts\1\0\2\rposition\vbottom\tsize\4\0����\3\1\3\0\0\trepl\fconsole\relements\1\0\2\rposition\tleft\tsize\3(\1\5\0\0\0\16breakpoints\vstacks\fwatches\1\0\2\tsize\t0.25\aid\vscopes\17expand_lines\rnvim-0.7\bhas\afn\bvim\rmappings\vexpand\1\0\5\tedit\6e\topen\6o\trepl\6r\vtoggle\6t\vremove\6d\1\3\0\0\t<CR>\18<2-LeftMouse>\nicons\1\0\0\1\0\3\rexpanded\b\18current_frame\b\14collapsed\b\nsetup\ndapui\frequire\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\17open_mapping\n<c-\\>\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
