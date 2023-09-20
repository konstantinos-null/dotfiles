" Neovim configuration file, contains non plugin related settings.
"
set showcmd         " Show (partial) command in status line.
set showmatch		    " Show matching brackets.
set ignorecase	    " Do case insensitive matching
set smartcase		    " Do smart case matching
set incsearch		    " Incremental search
set ruler		        " Set cursor position
" set autowrite		  " Automatically save before commands like :next and :make
" set hidden		      " Hide buffers when they are abandoned
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set bs=indent,eol,start

"set list
set cursorline  " Set current line
"set cursorcolumn " Set current column
set number		      " Set line numbers
set relativenumber  "Set number relative to the line you are
set wildmenu
"set wildmode=longtst:full
set autoindent


set updatetime=500
" How searching behaves
set smartcase "
set incsearch " Search as you type

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" Change map leader key to <space>
nnoremap <SPACE> <NOP>
let mapleader = " "

set encoding=UTF-8
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1

set termguicolors

" Count underscores as a word when navagating with b and w
" I think it messes when trying to use lsp stuff
"set iskeyword-=_
"
"
autocmd bufwritepost .tmux.conf execute ':!tmux source-file %'
autocmd bufwritepost .tmux.local.conf execute ':!tmux source-file %'
