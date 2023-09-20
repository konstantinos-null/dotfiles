-- Need to move this below
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
      mappings = {
        i = {
          ["<esc>"] = actions.close
      },
    },
  },
}

local M = {}
M.search_files = function()
    require("telescope.builtin").find_files({
    hidden = true,
})
end
