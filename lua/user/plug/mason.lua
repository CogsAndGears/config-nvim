-- language servers that we can safely pass directly to lspconfig with no additional
-- configuration
local auto_servers = {
  "clangd",
  "csharp_ls",
  "cmake",
  "clojure_lsp",
  "dotls",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "jdtls",
  "kotlin_language_server",
  "marksman",
  "sumneko_lua",
  "tsserver",
  "pyright",
  "yamlls",
}
-- language servers that require some manual steps to get them working the way we want
local manual_servers = {
  "rust_analyzer@latest",
}

-- lua is dumb and doesn't have a built-in list concatenation function
local function combine_lists(list_a, list_b)
  new_list = {}
  for _, v in ipairs(list_a) do
    table.insert(new_list, v)
  end
  for _, v in ipairs(list_b) do
    table.insert(new_list, v)
  end
end

local servers = combine_lists(auto_servers, manual_servers)

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

local function setup_rust_tools()
  local rt = require("rust-tools")
  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
      end,
    },
  })
end

local function setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })
  -- configure the simple servers
  for _, name in ipairs(auto_servers) do
    local ok, server = require("lspconfig")[name].setup{}
  end
  -- configure the servers which require more installation steps
  setup_rust_tools()
end

-- LSP Server package manager
local plug = {
  "williamboman/mason.nvim",
  requires = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "simrat39/rust-tools.nvim",
  },
  config = function ()
    require("user.plug.mason").setup()
  end,
}

return {
  plug = plug,
  setup = setup,
}
