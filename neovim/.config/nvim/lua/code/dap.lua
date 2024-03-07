local status_ok, dap = pcall(require, "dap")
if not status_ok then
    print("Something went wrong with dap")
    return
end

local status_ok, dapui = pcall(require, "dapui")
if not status_ok then
    print("Something went wrong with dapui")
    return
end

dapui.setup{

}

vim.keymap.set('n', '<Leader>du', function () require('dapui').toggle() end, { desc = "DAP ui toggle"})

require('dap-python').setup('~/.venv/pipx/bin/python3')


vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "DAP toggle breakpoint"})
vim.keymap.set('n', '<Leader>dc', function() require('dap').continue() end, { desc = "DAP continue"})
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP run last"})
