local themes = require("telescope.themes")
local actions = require("telescope.actions")
require("telescope").setup{
  defaults = {
      vimgrep_arguments = { "rg", "--color=never", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--glob", "!.git/*", "--glob", "!.gitmodules"},
      mappings = {
        i = {
          ["<esc>"] = actions.close,
          ["<C-v>"] = actions.select_vertical,
          ["<C-x>"] = actions.select_horizontal,
      },
    },
  },
  extensions = {
      ["ui-select"] = {
          require("telescope.themes").get_dropdown {
          }
      },
      fzf = {

      },
      repo = {
          settings = {
              auto_lcd = true
          }
      }
  },
  pickers = {
      git_files = {
          theme = "dropdown"
      },
      live_grep = {
          theme = "dropdown"
      },
      find_files = {
          theme = "dropdown"
      },
      marks = {
          theme = "dropdown"
      },
  }
}

-- require('telescope').load_extension('fzf')
-- require('telescope').load_extension('repo')
-- require("telescope").load_extension("ui-select")


-- local M = {}
-- M.search_files = function()
--     require("telescope.builtin").find_files({
--     hidden = true,
-- })
-- end

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<Leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<Leader>lg', 'builtin.live_grep<CR>')
-- vim.keymap.set('n', '<Leader><Leader>c', [[<Cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true})
-- vim.keymap.set('n', '<Leader>gr', [[<Cmd>lua require'telescope'.extensions.repo.list()<CR>]], { noremap = true, silent = true})
-- vim.keymap.set('n', '<Leader>t', [[<Cmd>lua require('telescope.builtin')<CR>]], { noremap = true, silent = true})
--
-- vim.keymap.set('n', '<Leader>cd', [[<Cmd>glcd<CR>]], { noremap = true, silent = true})
