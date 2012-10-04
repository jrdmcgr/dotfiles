set nocompatible                " be iMproved. Must be first line.
syntax on
color monokai

set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set encoding=utf-8              " Use unicode for everything.
set fillchars=vert:\            " Set the vertical split character to a space.
set hidden                      " Allow buffer switchng without saving.
set laststatus=2                " Always show the status bar. (for powerline)
set mouse=a                     " Enable the mouse; clicking and scrolling
set number                      " Turn on line numbers
set term=screen-256color         " Enable 256 colors. 

" Default tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab                   " Convert tabs to spaces.
set pastetoggle=<F2>            " Key to toggle auto indenting when pasting.

set wildchar=<Tab> 
set wildmenu 
set wildmode=full
set clipboard=unnamedplus


" -----------------------------------------------------------------------------
"   Variables
" -----------------------------------------------------------------------------

let mapleader = ','

" Block cursor in normal mode; Thin cursor in insert mode.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

 " Don't complain if vim isn't compiled with ruby
let g:LustyJugglerSuppressRubyWarning = 1  
let NERDTreeMinimalUI = 1
let g:Powerline_symbols = 'fancy'
let g:ackprg = 'ag --nogroup --nocolor --column'

" -----------------------------------------------------------------------------
"   Key maps
" -----------------------------------------------------------------------------

" Toggle line numbers for selecting text from the terminal.        
" nmap <F2> :set invnumber<CR>  
nmap ; :
imap jj <Esc>
imap <S-Tab> <C-p>

nmap <Leader>n :NERDTreeToggle<CR>

" Buffer shortcuts
nmap <Leader>bb :ls<CR>:buffer<Space> 
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bd :bd<CR>
nmap <Leader>bdd :bd!<CR>

" Quickly edit/reload the vimrc file
nnoremap <Leader>ev :e $MYVIMRC<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>

" Move to beginning and end of line in insert mode.
" These are the emacs keybindings that are ubiqitous on OS X.
inoremap <C-e> <Esc>A
inoremap <C-a> <Esc>I

" Forgot to sudo
cmap w!! w !sudo tee % >/dev/null
cmap x!! x !sudo tee % >/dev/null

cmap Q q!


" -----------------------------------------------------------------------------
" Bundles
" -----------------------------------------------------------------------------

filetype off               " required by vundle.
filetype plugin indent on  " required by vundle.
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'tpope/vim-rails.git'
Bundle 'scrooloose/nerdtree'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'LustyJuggler'
Bundle 'git://git.wincent.com/command-t.git'
Bundle 'spolu/dwm.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-coffee-script'
" Bundle 'Shougo/neocomplcache'
Bundle 'davidoc/taskpaper.vim'
Bundle 'troydm/easybuffer.vim'
Bundle 'python.vim'



" -----------------------------------------------------------------------------
"   Interface Colors
" -----------------------------------------------------------------------------

" Line number color
highlight LineNr ctermfg=8 ctermbg=bg

" Improve vimdiff syntax highlighting. This isn't really a big improvement.
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

highlight NonText ctermfg=bg guifg=bg

highlight VertSplit ctermbg=232



