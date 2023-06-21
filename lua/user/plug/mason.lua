-- language servers that we can safely pass directly to lspconfig with no additional
-- configuration
local auto_servers = {
  "clangd",
  "csharp_ls",
  "cmake",
  "clojure_lsp",
  "cssls",
  "dotls",
  "dockerls",
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
  "graphql",
}
-- language servers that require some manual steps to get them working the way we want
local manual_servers = {
  "rust_analyzer@nightly",
  "eslint",
}

-- makes a new list with the first element of the passed-in list
local function get_first_elm(list_a)
  local new_list = {}
  for _, v in ipairs(list_a) do
    table.insert(new_list, v[1])
  end
  return new_list
end

-- lua is dumb and doesn't have a built-in list concatenation function
local function combine_lists(list_a, list_b)
  local new_list = {}
  for _, v in ipairs(list_a) do
    table.insert(new_list, v)
  end
  for _, v in ipairs(list_b) do
    table.insert(new_list, v)
  end
  return new_list
end

local servers = combine_lists(auto_servers, manual_servers)

-- Set up keymaps when attaching LSP to a buffer
local on_attach = function(client, buffer)
  -- mappings
  -- see `:help vim.lsp.*` for documentation
  -- settings from here: https://github.com/neovim/nvim-lspconfig#keybindings-and-completion
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  --vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  --vim.keymap.set('n', '<space>wl', function()
  --  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  --end, bufopts)
  --vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  --vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  --vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  --vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end


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
      on_attach = function(client, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })

        on_attach(client, bufnr)
      end,
    },
  })
end

local function setup_eslint(capabilities)
  require("lspconfig").eslint.setup({
    capabilities=capabilities,
    on_attach = function(client, bufnr)
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        command = "EslintFixAll",
      })
      on_attach(client, bufnr)
    end,
    settings={
      run = "onSave",
    },
  })
end

local function setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = servers,
  })
  -- configure the simple servers
  local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
  for _, name in ipairs(auto_servers) do
    local ok, server = require("lspconfig")[name].setup({
      capabilities=capabilities,
      on_attach=on_attach,
    })
  end
  -- configure the servers which require more installation steps
  setup_rust_tools()
  setup_eslint(capabilities)
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
