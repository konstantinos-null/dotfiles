vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



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
  'ryanoasis/vim-devicons',
  'kyazdani42/nvim-web-devicons',
  'kyazdani42/nvim-tree.lua',

  -- Snippets
  -- 'hrsh7th/vim-vsnip',
  -- 'hrsh7th/vim-vsnip-integ',
  'l3mon4d3/luasnip',
  'saadparwaiz1/cmp_luasnip',

  -- lsp related stuff, trying it out,
{
  'neovim/nvim-lspconfig',
  dependencies = {
    {'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    { 'folke/neodev.nvim', opts = {} },
  },
},


-- TODO tomorrow cleanup
  'hrsh7th/cmp-nvim-lsp',
  -- Autocompletion stuff
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  -- 'hrsh7th/cmp-vsnip',
  'hrsh7th/cmp-nvim-lua',
  -- 'hrsh7th/nvim-compe',

  -- Telescope related entries,
{
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',


  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
    },
  },
},
  'nvim-lua/popup.nvim',
  -- 'nvim-telescope/telescope-ui-select.nvim',
  -- 'nvim-telescope/telescope-file-browser.nvim',
  --
  'cljoly/telescope-repo.nvim',
  'airblade/vim-rooter',

  -- treesitter related plugins,
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
},

-- DAP plugins
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'mfussenegger/nvim-dap-python',

  -- utilities,
  'akinsho/toggleterm.nvim',
  'ggandor/leap.nvim',
  { 'folke/which-key.nvim', opts = {} },

  -- ansible related plugins,
  'pearofducks/ansible-vim',
  -- 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'},
   -- icons,
})

require('user.config')
require('user.snips')

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

-- vim: ts=2 sts=2 sw=2 et
