call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'townk/vim-autoclose'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
call plug#end()

syntax enable
" set background=dark
set background=light
colorscheme solarized
let g:airline_theme='simple'

set cursorcolumn
set cursorline
" hi CursorLine term=bold cterm=bold guibg=Grey10
" set spell spelllang=es
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Source_Code_Pro:h9:cANSI:qDRAFT
set encoding=utf-8
set backspace=indent,eol,start
set number
set incsearch
set list
set listchars=tab:>·,trail:·
set tabstop=4

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'
au GUIEnter * simalt ~x
