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
