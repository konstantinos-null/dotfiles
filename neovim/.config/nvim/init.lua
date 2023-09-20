local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
'kylechui/nvim-surround',
'windwp/nvim-autopairs',
'numToStr/Comment.nvim',
-- UI plugins
'akinsho/bufferline.nvim',
'mrjones2014/legendary.nvim',
'stevearc/dressing.nvim',
'nvim-lualine/lualine.nvim',
'SmiteshP/nvim-navic',
'MunifTanjim/nui.nvim',
'rcarriga/nvim-notify',
'folke/noice.nvim',
'folke/trouble.nvim',
'rebelot/kanagawa.nvim',
-- Snippets
'hrsh7th/vim-vsnip',
'hrsh7th/vim-vsnip-integ',
'l3mon4d3/luasnip',
'saadparwaiz1/cmp_luasnip',
-- lsp related stuff, trying it out,
{'williamboman/mason.nvim', build = ":MasonUpdate"},
'williamboman/mason-lspconfig.nvim',
'neovim/nvim-lspconfig',
'hrsh7th/cmp-nvim-lsp',
-- autocompletion stuff,
'hrsh7th/nvim-cmp',
'hrsh7th/cmp-buffer',
'hrsh7th/cmp-path',
'hrsh7th/cmp-cmdline',
'hrsh7th/cmp-vsnip',
'hrsh7th/cmp-nvim-lua',
'hrsh7th/nvim-compe',
-- telescope related entries,
'nvim-lua/plenary.nvim',
'nvim-lua/popup.nvim',
'nvim-telescope/telescope.nvim',
'nvim-telescope/telescope-ui-select.nvim',
'nvim-telescope/telescope-file-browser.nvim',
-- {'nvim-telescope/telescope-fzf-native.nvim', cmd = 'make'},
'cljoly/telescope-repo.nvim',
'airblade/vim-rooter',
-- treesitter related plugins,
{'nvim-treesitter/nvim-treesitter', cmd = 'TSUpdate'},
'mfussenegger/nvim-dap',
'rcarriga/nvim-dap-ui',
'mfussenegger/nvim-dap-python',
-- utilities,
'akinsho/toggleterm.nvim',
'ggandor/leap.nvim',
-- ansible related plugins,
'pearofducks/ansible-vim',
-- 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'},
 -- icons,
'ryanoasis/vim-devicons',
'kyazdani42/nvim-web-devicons',
'kyazdani42/nvim-tree.lua',
})

require('user.config')

require('ui.lualine')
require('ui.bufferline')
require('ui.devicons')
require('ui.noice')

require('utilities.telescope-config')
require('utilities.toggleterm')
require('utilities.treesitter')
require('utilities.legendary')


require('code.autopairs')
require('code.cmp')
require('code.dap')
require('code.lspconf')
require('code.mason')




