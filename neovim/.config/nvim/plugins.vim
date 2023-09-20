"neovim/.local/share/nvim/site/autoload/plug.vim Neovim configuration file, contains plugin related settings.
" Brackets visual modification
let g:rainbow_active = 1

" Deoplete configuration
"let g:deoplete#enable_at_startup = 0

" Ale specific settings
"let g:ale_completion_enabled = 0

" netrw configuration
"let g:netrw_browse_split = 2
"let g:netrw_banner = 0
"let g:netrw_winsize = 25
nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <leader>da :Lexplore <CR>

set completeopt=menuone,noinsert,noselect

" configuration for ansible-vim in order to set proper filetype for playbooks
" inside the non default directories
au Bufread,BufNewFile */playbooks/*.{yml,yaml} set filetype=yaml.ansible
au Bufread,BufNewFile */ansible/*.{yml,yaml} set filetype=yaml.ansible
