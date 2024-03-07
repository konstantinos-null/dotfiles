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
          theme = "dropdown",
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*"}
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
vim.keymap.set('n', '<Leader>lg', builtin.live_grep, {})
-- vim.keymap.set('n', '<Leader><Leader>c', [[<Cmd>lua require('telescope.builtin').commands()<CR>]], { noremap = true, silent = true})
-- vim.keymap.set('n', '<Leader>gr', [[<Cmd>lua require'telescope'.extensions.repo.list()<CR>]], { noremap = true, silent = true})
-- vim.keymap.set('n', '<Leader>t', [[<Cmd>lua require('telescope.builtin')<CR>]], { noremap = true, silent = true})
--
-- vim.keymap.set('n', '<Leader>cd', [[<Cmd>glcd<CR>]], { noremap = true, silent = true})


-- Install toggleterm
local toggleterm_ok, toggleterm = pcall(require, "toggleterm")
if not toggleterm_ok then
    print("Something went wrong with toggleterm")
    return
end

toggleterm.setup({
    direction = "float"
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
--  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({ cmd = "tig", hidden = true })
    
function _lazygit_toggle()
  lazygit:toggle()
end
    
vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


-- Install leap
local leap_ok, leap = pcall(require, "leap")
if not leap_ok then
    print("leap")
    return
end

require('leap').add_default_mappings()


-- Install legendary
local legendary_ok, legendary = pcall(require, "legendary")
if not legendary_ok then
    print("Something went wrong with legendary")
    return
end

legendary.setup({
  -- Include builtins by default, set to false to disable
  include_builtin = true,
  -- Customize the prompt that appears on your vim.ui.select() handler
  select_prompt = 'Legendary',
  -- Initial keymaps to bind
  keymaps = {
    -- your keymap tables here
    { '<C-d>',  description = 'Scroll up' },
    { '<C-f>',  description = 'Scroll down' },
  },
  -- Initial commands to bind
  commands = {
    -- your command tables here
  },
  -- Initial augroups and autocmds to bind
  autocmds = {
    -- your autocmd tables here
  },
  -- Automatically add which-key tables to legendary
  -- see "which-key.nvim Integration" below for more details
  auto_register_which_key = false,
})



local keymaps = {
    { '<C-d>',  description = 'Scroll up' },
    { '<C-f>',  description = 'Scroll down' },
}

-- Install treesitter
local treesitter_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
    print("Something went wrong with tree-sitter")
    return
end

-- TODO: 
treesitter.setup({
  highlight = {{ enable = true }, { disable = "help"}},
  ensure_installed = { "bash" , "comment", "dockerfile", "go", "lua", "python", "yaml" },
})
-- treesitter.highlight.setup()

-- Comment.nvim setup
local comment_ok, comment = pcall(require, "Comment")
if not comment_ok then
    print("Something went wrong with comment.nvim")
    return
end

comment.setup({
})

local surround_ok, surround = pcall(require, "nvim-surround")
if not surround_ok then
    print("Something went wrong with surround.nvim")
    return
end

surround.setup({
})
