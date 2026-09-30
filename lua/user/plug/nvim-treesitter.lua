local languages = {
  "css",
  "html",
  "json",
  "lua",
  "php",
  "rust",
  "sql",
  "toml",
  "tsx",
  "yaml",
}
local function setup()
  require("nvim-treesitter").install(languages)
  -- connect nvim folding api to treesitter
  --vim.wo.foldmethod = 'expr'
  --vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
  ---vim.api.nvim_create_autocmd("FileType", {
  ---  pattern = { "<filetype>" },
  ---  callback = function() vim.treesitter.start() end,
  ---})
  vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
      local lang = vim.treesitter.language.get_lang(args.match)
      if not lang or not vim.treesitter.language.add(lang) then
        return
      end
      vim.treesitter.start(args.buf, lang)
      vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
  })
end

local plug = {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("user.plug.nvim-treesitter").setup()
  end
}

return {
  plug = plug,
  setup = setup,
}
