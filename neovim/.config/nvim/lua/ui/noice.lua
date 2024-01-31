local status_ok, noice = pcall(require, "noice")
if not status_ok then
    print("Something went wrong with noice")
    return
end

-- noice.setup({
--   views = {
--     cmdline_popup = {
--         border = "none",
--         padding = { 2, 3},
--     },
--   },
--   filter_options = {},
--     win_options = {
--         winblend = 10,
--         winhighlight = {
--             Normal = "Normal",
--             FloatBorder = "SpecialChar"
--         },
--     },
-- })
--
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



require("nvim-tree").setup()
vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", {silent=true, noremap=true})
