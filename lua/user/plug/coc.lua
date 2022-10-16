
local plug = {
  "neoclide/coc.nvim", branch = "release", config = function()
    local coc_extra = require("user.plug.coc-extra")
    coc_extra.set_extensions()
    coc_extra.map_keys()
  end
}

return {
  plug = plug,
}
