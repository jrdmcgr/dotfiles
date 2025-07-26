set nocompatible                " be iMproved. Must be first line.
syntax on
color monokai
"set cursorline                  " Highlight the current line.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set encoding=utf-8              " Use unicode for everything.
set fillchars=vert:\            " Set the vertical split character to a space
set hidden                      " Allow buffer switchng without saving
set mouse=a                     " Enable the mouse; clicking and scrolling
set term=screen-256color        " Enable 256 colors.
set autoindent                  " Use C-style indentation
set pastetoggle=<F2>            " Key to toggle auto indenting when pasting.
set shortmess=atIO              " Do not show startup message

" Search settings
set hlsearch
set incsearch
set ignorecase                  " Ignore case when searching
set smartcase                   " Case insensitive search unless uppercase chars are in the search string.

" Don't create backups or swapfiles
set nowritebackup
set nobackup
set noswapfile

" Remove the deleay when pressing esc.
set timeoutlen=1000
set ttimeoutlen=0

" 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set nowrap                      " Don't wrap long lines.

" show current command, matching bracket and mode, line numbers
set showcmd
set noshowmatch
set number

" Long undo and command history
set undolevels=1000
set history=200

" Save undo history permanently
if has('persistent_undo')
    set undodir=~/.vimundo
    set undofile
endif

" show a few lines below the current line
set scrolloff=5
set sidescrolloff=5

" Highlight the 100th column
"if exists("+colorcolumn")
"   set colorcolumn=100
"endif

" Decrease dead time after ESC key
set ttimeout
set ttimeoutlen=50

" -----------------------------------------------------------------------------
"   Variables
" -----------------------------------------------------------------------------

" Fat cursor when in normal mode and skinny cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:python_highlight_all = 1

" netrw is the built in file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" The code below will automatically open the drawer when vim is started.
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

" -----------------------------------------------------------------------------
"   Key maps
" -----------------------------------------------------------------------------

" Move to beginning and end of line in insert mode.
" These are the emacs keybindings that are ubiqitous on OS X.
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Forgot to sudo
cmap w!! w !sudo tee % >/dev/null
cmap x!! x !sudo tee % >/dev/null

" fzf
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<cr>


" Use backspace in normal mode
nnoremap <bs> X


" Use softwrapping in text documents
autocmd FileType text,markdown,tex,html setlocal wrap linebreak
if exists('+breakindent')
    set breakindent
endif

" remap :W, :Q etc if you press the shift key for too long
cabbrev Q quit
cabbrev W write
cabbrev WQ wq
cabbrev Wq wq

" -----------------------------------------------------------------------------
"   Interface Colors
" -----------------------------------------------------------------------------

highlight LineNr ctermfg=8 ctermbg=bg " Line number color
highlight NonText ctermfg=bg guifg=bg
highlight VertSplit ctermbg=232 " vertical split
"highlight CursorLine ctermbg=white ctermfg=8
highlight Visual ctermbg=17
