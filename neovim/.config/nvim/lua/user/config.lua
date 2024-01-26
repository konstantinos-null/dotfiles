local set = vim.opt

set.showcmd = true        -- Show (partial) command in status line.
set.showmatch = true		    -- Show matching brackets.
set.ignorecase = true	    -- Do case insensitive matching
set.smartcase = true		    -- Do smart case matching
set.incsearch = true		    -- Incremental search
set.ruler = true	        -- Set cursor position
--set autowrite = true		  -- Automatically save before commands like :next and :make
--set hidden		      -- Hide buffers when they are abandoned
set.tabstop=4
set.softtabstop=4
set.shiftwidth=4
set.expandtab = true
set.smarttab = true
set.bs = 'indent,eol,start'

--set list
set.cursorline = true  -- Set current line
--set cursorcolumn -- Set current column
set.number = true		      -- Set line numbers
set.relativenumber = true  --Set number relative to the line you are
set.wildmenu = true
--set wildmode=longtst:full
set.autoindent = true

set.termguicolors = true
vim.cmd("colorscheme kanagawa-dragon")
-- set.background = 'dark'

set.updatetime=500
-- How searching behaves
set.smartcase = true --
set.incsearch = true -- Search as you type

set.laststatus=3

set.undofile = true

-- set.autochdir = true

set.splitkeep = "cursor"

-- Plugins related configuration
--

vim.g.netrw_browse_split = '2'
vim.g.netrw_banner = '0'


vim.keymap.set('n', '<Leader>dd', '<Cmd>Lexplore %:p:h<CR>')
vim.keymap.set('n', '<Leader>da', '<Cmd>Lexplore<CR>')
