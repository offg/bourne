"begin <editing>
set autoindent
set shiftwidth=4
set expandtab
set tabstop=4
set backspace=indent,eol,start
set clipboard=unnamed
"end <editing>

"begin <search>
set ignorecase
set smartcase
set incsearch
set hlsearch
"end <search>

"begin <display>
set number
set list
set listchars=tab:>-
"end <display>

set foldmethod=indent
set foldlevel=99
"begin <key binding>
inoremap jj <Esc>
    "search word under the cursor
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
    "hide highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>
    "centering jumped word
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
    "for wrapped text
nnoremap j gj
nnoremap k gk
"end <key binding>

"begin <syntax highlighting>
if version < 600
  syntax clear
elseif exists('b:current_after_syntax')
  finish
endif

" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn match pythonOperator "\(+\|=\|-\|\^\|\*\)"
syn match pythonDelimiter "\(,\|\.\|:\)"
syn keyword pythonSpecialWord self

hi link pythonSpecialWord    Special
hi link pythonDelimiter      Special

"ctag
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

let b:current_after_syntax = 'python'

let &cpo = s:cpo_save
unlet s:cpo_save

"end <syntax highlighting>


":colorscheme molokai
"syntax on

set filetype=off
let g:python_highlight_all = 1

setlocal omnifunc=jedi#completions

"begin <syntastic config>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0 
let g:syntastic_python_checkers = ['pyflakes']
let g:jedi#show_call_signatures = "0"
let g:syntastic_python_flake8_args = "--ignore=F821,E302,E501"
let g:syntastic_python_flake8_args = "--max-line-length=160"
"end <syntastic config>

"begin <autopep config>
" original http://stackoverflow.com/questions/12374200/using-uncrustify-with-vim/15513829#15513829
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

    "Shift+f = autofix
autocmd FileType python nnoremap <S-f> :call Autopep8()<CR>
"end <autopep config>
call plug#begin('~/.vim/plugged')
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/Unite.vim'
Plug 'fatih/vim-go'
Plug 'lambdalisue/vim-django-support'
Plug 'jmcantrell/vim-virtualenv'
Plug 'scrooloose/syntastic'
Plug 'nvie/vim-flake8'
Plug 'jnurmine/Zenburn'
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'Quramy/tsuquyomi'
call plug#end()


"if has('gui_running')
"  set background=dark
"  colorscheme solarized
"else
"set background=dark
"  colorscheme zenburn
"endif
"colorscheme solarized

colorscheme hybrid
set background=dark
