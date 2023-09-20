local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    print("Something went wrong with lualine")
    return
end

lualine.setup({
   options = {
    theme = 'palenight',
    globalstatus = true
   }
})

vim.opt.winbar = '%=%f'
