set nocompatible                " be iMproved. Must be first line.
syntax on
color monokai
set cursorline                  " Highlight the current line.
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode
set encoding=utf-8              " Use unicode for everything.
set fillchars=vert:\            " Set the vertical split character to a space
set hidden                      " Allow buffer switchng without saving
set mouse=a                     " Enable the mouse; clicking and scrolling
set number                      " Turn on line numbers
set term=screen-256color        " Enable 256 colors.
set pastetoggle=<F2>            " Key to toggle auto indenting when pasting.
set nowrap                      " Don't wrap long lines.
set ignorecase                  " Ignore case when searching.
set smartcase                   " Case insensitive search unless uppercase chars are in the search string.
set nobackup                    " Don't create backup files
set noswapfile                  " Don't create swap files

" Remove the deleay when pressing esc.
set timeoutlen=1000
set ttimeoutlen=0

" 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" -----------------------------------------------------------------------------
"   Variables
" -----------------------------------------------------------------------------

" Fat cursor when in normal mode and skinny cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:python_highlight_all = 1

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

" -----------------------------------------------------------------------------
"   Interface Colors
" -----------------------------------------------------------------------------

highlight LineNr ctermfg=8 ctermbg=bg " Line number color
highlight NonText ctermfg=bg guifg=bg
highlight VertSplit ctermbg=232 " vertical split
