imap jj <Esc>

autocmd BufWritePost *.py call Flake8()
let g:syntastic_python_checkers=["flake8"]
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
call plug#end()
