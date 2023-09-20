local status_ok, legendary = pcall(require, "legendary")
if not status_ok then
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
