local servers = {
  "rust_analyzer@latest",
  "tsserver",
}

-- we have to remove any @version string from package names when passing them in
-- to nvim-lspconfig
local function strip_ver(package_name)
  local found_index = package_name:find("@", 1, true)
  if found_index == nil then
    return package_name
  end
  local result = package_name:sub(1, found_index - 1)
  return result
end

local function setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })
  for _, name in ipairs(servers) do
    local ok, server = require("lspconfig")[strip_ver(name)].setup{}
  end
end

return {
  setup = setup,
}
