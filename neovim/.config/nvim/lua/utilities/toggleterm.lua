local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
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

local status_ok, leap = pcall(require, "leap")
if not status_ok then
    print("leap")
    return
end

require('leap').add_default_mappings()

