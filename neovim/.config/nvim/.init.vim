
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Language specific settings
Plug 'hashivim/vim-terraform'
Plug 'fatih/vim-go'

" Code stuff like parenthesis etc.
Plug 'kylechui/nvim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'

" Git stuff
Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'tpope/vim-fugitive'

" Document writing
Plug 'https://github.com/junegunn/goyo.vim.git'
Plug 'https://github.com/junegunn/limelight.vim.git'

" Nvim visual plugins
Plug 'akinsho/bufferline.nvim'
Plug 'mrjones2014/legendary.nvim'
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'SmiteshP/nvim-navic'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'folke/noice.nvim'

" Colorschemes
Plug 'https://github.com/dracula/vim.git',{'as':'dracula'}
Plug 'catppuccin/nvim',{'as':'catppuccin'}
Plug 'NLKNguyen/papercolor-theme'
Plug 'rebelot/kanagawa.nvim'

" Snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

" LSP related stuff, trying it out
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Autocompletion stuff
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
"Plug 'hrsh7th/nvim-compe'

"Telescope related entries
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
Plug 'cljoly/telescope-repo.nvim'
Plug 'airblade/vim-rooter'

"Treesitter related plugins
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'mfussenegger/nvim-dap-python'

" Utilities
Plug 'akinsho/toggleterm.nvim'
Plug 'ggandor/leap.nvim'

" Ansible related plugins
Plug 'pearofducks/ansible-vim'
"Plug 'yaegassy/coc-ansible', {'do': 'yarn install --frozen-lockfile'}

" Add icons
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

"let g:plug_window = "vertical topleft new"
"
" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
source ~/.config/nvim/config.vim
source ~/.config/nvim/plugins.vim
source ~/.config/nvim/commands.vim
"source ~/.config/nvim/init.lua

lua <<EOF
require('user.autopairs')
require('user.bufferline')
require('user.cmp')
require('user.devicons')
require('user.legendary')
--require('user.lspconf')
require('user.lualine')
require('user.mason')
require('user.telescope-config')
require('user.toggleterm')
require('user.treesitter')
require('user.noice')
require('user.config')
require('user.nullls')
require('user.dap')

EOF

colorscheme kanagawa
" colorscheme kanagawa
