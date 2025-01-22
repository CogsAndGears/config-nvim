local languages = {
  "css",
  "html",
  "json",
  "lua",
  "php",
  "rust",
  "toml",
  "tsx",
  "yaml",
}
local function setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = languages,
    auto_install = true,
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    indent = { enable = true},
    rainbox = {
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
    },
    peek_definition_code = {
      ["<leader>J"] = "@function.outer",
      ["<leader>Q"] = "@class.outer",
    }
  }

  -- connect nvim folding api to treesitter
  --vim.wo.foldmethod = 'expr'
  --vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
end

local plug = {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("user.plug.nvim-treesitter").setup()
  end
}

return {
  plug = plug,
  setup = setup,
}
