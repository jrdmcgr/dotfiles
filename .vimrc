set number
set mouse=a
" Something to do with buffers.
set hidden

" Improve vimdiff syntax highlighting.
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
     
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    
" Not sure how this works, but it's supposed to make vim work like the less pager.
autocmd FileType man setlocal ro nonumber nolist fdm=indent fdn=2 sw=4 foldlevel=2 | nmap q :quit

" Toggle line numbers for selecting text from the terminal.         
nmap <F2> :set invnumber<CR>  
nmap ; :
imap jj <Esc>
imap <Tab> <C-p>

set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent on      " required!


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


let g:LustyJugglerSuppressRubyWarning = 1
let NERDTreeMinimalUI=1
