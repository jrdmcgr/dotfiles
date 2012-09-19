set nocompatible        " be iMproved. Must be first line.
syntax on

set number
set mouse=a
set hidden              " Allow buffer switchng without saving.
set backspace=indent,eol,start
set fillchars=vert:\    " Set the vertical split character to a space.
set encoding=utf-8
set laststatus=2        " Always show the status bar. (for powerline)
set term=screen-256color

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wildchar=<Tab> wildmenu wildmode=full
     
" Change the cursor to a line when in insert mode.
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let g:LustyJugglerSuppressRubyWarning = 1
let NERDTreeMinimalUI = 1
let g:Powerline_symbols = 'fancy'
let mapleader = ','
" Toggle line numbers for selecting text from the terminal.        
nmap <F2> :set invnumber<CR>  
nmap ; :
imap jj <Esc>
imap <S-Tab> <C-p>
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>bb :ls<CR>:buffer<Space> 

" -----------------------------------
" Bundles
" -----------------------------------
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

" Can't get this to work
Bundle 'vim-coffee-script'
autocmd BufNewFile,BufRead *.coffee set filetype=coffee'

" Line number color
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Improve vimdiff syntax highlighting. This isn't really a big improvement.
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black

" Make the tildes invisble
highlight NonText ctermfg=0
