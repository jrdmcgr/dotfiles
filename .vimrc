set number
set mouse=a

highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black
     
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    
" Not sure how this works, but it's supposed to make vim work like the less pager.
autocmd FileType man setlocal ro nonumber nolist fdm=indent fdn=2 sw=4 foldlevel=2 | nmap q :quit

" Toggle line numbers for selecting text from the terminal.         
nmap <F2> :set invnumber<CR>  

" Remap escape to jj. 
imap jj <Esc>
