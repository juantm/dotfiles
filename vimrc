call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'townk/vim-autoclose'
Plug 'altercation/vim-colors-solarized'
call plug#end()

syntax enable
set background=light
colorscheme solarized
let g:airline_theme='simple'

set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey80
" set spell spelllang=es
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Source\ Code\ Pro\ 10

set number
set incsearch
