local noice_ok, noice = pcall(require, "noice")
if not noice_ok then
    print("Something went wrong with noice")
    return
end

noice.setup({
    views = {
        cmdline_popup = {
          position = {
              row = 5,
              col = "50%",
          },
          size = {
              width = 60,
              height = "auto",
          },
        popupmenu = {
          relative = "editor",
          position = {
              row = 8,
              col = "50%",
          },
          size = {
              width = 30,
              height = "auto",
          },
          border = {
              style = "rounded",
              padding = { 0, 1 },
          },
          win_options = {
              winhighlight = "Normal:Normal,FloatBorder:DiagnosticInfo",
          },
        },
      },
    },
})

vim.keymap.set("n", "<leader>dis", function ()
    require("noice").cmd("dismiss")
end)

vim.keymap.set("n", "<leader>er", function ()
    require("noice").cmd("telescope")
end)


--Trouble nvim
require("trouble").setup()
-- set keymap for trouble.nvim
vim.keymap.set("n", "<leader>xx", function () require("trouble").toggle() end, {desc = "Toggle trouble"})


-- Nvimtree
require("nvim-tree").setup()
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent=true, noremap=true, desc="Toggle Tree file explorer"})


-- Bufferline
local bufferline_ok, bufferline = pcall(require, "bufferline")
if not bufferline_ok then
    print("Something went wrong with bufferline")
    return
end

bufferline.setup()

-- Devicons
local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
if not devicons_ok then
    print("Something went wrong with nvim-web-devicons")
    return
end

devicons.setup()

-- Lualine
local lualine_ok, lualine = pcall(require, "lualine")
if not lualine_ok then
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
