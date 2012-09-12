set number
set mouse=a
set hidden                 " Something to do with buffers
set nocompatible           " be iMproved
filetype off               " required by vundle.
filetype plugin indent on  " required by vundle.
syntax on

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Improve vimdiff syntax highlighting.
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
     

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


" Toggle line numbers for selecting text from the terminal.        
nmap <F2> :set invnumber<CR>  
nmap ; :
imap jj <Esc>
imap <S-Tab> <C-p>


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

let g:LustyJugglerSuppressRubyWarning = 1
let NERDTreeMinimalUI=1
