" Make Vim more useful
set nocompatible

" vim-pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on
autocmd VimEnter * Helptags
" from vim-pathogen README: Normally to generate documentation, Vim expects
" you to run :helptags on each directory with documentation (e.g., :helptags
" ~/.vim/doc). Provided with pathogen.vim is a :Helptags command that does
" this on every directory in your 'runtimepath'. If you really want to get
" crazy, you could even invoke Helptags in your vimrc.

" Use the Solarized Dark theme
set background=dark
colorscheme solarized
" per https://github.com/airblade/vim-gitgutter:
"   highlight clear SignColumn
" as this didn't work, had to edit
" ~/.vim/bundle/vim-colors-solarized/colors/solarized.vim and changed the
" SignColumn from
"   exe "hi! SignColumn"     .s:fmt_none   .s:fg_base0
" to
"   exe "hi! SignColumn"     .s:fmt_none   .s:fg_base01 .s:bg_base02
" to match the colors in the LineNr column

" prevent vim-bufferline from echoing buffer names to command bar
let g:bufferline_echo = 0

" Exit insert mode without using Esc (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
inoremap jk <Esc>
inoremap kj <Esc>

" Allow mispelings when :wq-ing (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
cabbrev ew :wq
cabbrev qw :wq

" Switch windows with two keystrokes (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h

" Enter command mode with one keystroke (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
nnoremap ; :
"nnoremap : ;

" Start an external command with a single bang (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
nnoremap ! :!

" Auto-save a file when you leave insert mode (http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html)
autocmd InsertLeave * if expand('%') != '' | update | endif

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Don’t add empty newlines at the end of files
set binary
set noeol
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/private/tmp/*

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax on
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif
" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	:%s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
	" Treat .md files as Markdown
	autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif
