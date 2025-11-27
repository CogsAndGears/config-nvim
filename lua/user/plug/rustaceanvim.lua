-- https://github.com/mrcjkb/rustaceanvim

local function setup()
end

local plug = {
  "mrcjkb/rustaceanvim",
  version = "^6", -- recommended
  lazy = false, -- this plugin is already lazy
}

return {
  plug=plug,
  setup=setup,
}
