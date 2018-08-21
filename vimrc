set nocompatible
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ervandew/supertab'
Plug 'townk/vim-autoclose'
Plug 'altercation/vim-colors-solarized'
Plug 'dikiaap/minimalist'
Plug 'tpope/vim-fugitive'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'powerline/fonts'
call plug#end()

syntax on
set background=dark
" set background=light
" colorscheme solarized
colorscheme minimalist

set cursorcolumn
set cursorline
" hi CursorLine term=bold cterm=bold guibg=Grey10
" set spell spelllang=es
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Source_Code_Pro:h9:cANSI:qDRAFT
" set guifont=Source_Code_Pro_for_Powerline:h9:cANSI:qDRAFT
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set number
set incsearch
set list
set listchars=tab:>·,trail:·
set tabstop=4
set hlsearch

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'
au GUIEnter * simalt ~x

"Airline options
" let g:airline_theme='solarized'
let g:airline_theme='minimalist'
" let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_symbols_ascii = 1
" Fin Vimairline
" para plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Hasta aquí para plugin syntastic
