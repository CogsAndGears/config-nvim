-- https://github.com/mrcjkb/rustaceanvim
-- HIGHLY RECOMMENDED TO ADD `rust-analyzer` TO YOUR TOOLCHAIN
--
-- ```bash
-- rustup component add rust-analyzer
-- ```
--
-- If you are seeing errors about starting rust-analyzer this is probably why.

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
