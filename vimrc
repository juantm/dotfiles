call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'townk/vim-autoclose'
Plug 'dikiaap/minimalist'
Plug 'vim-scripts/highlight_current_line.vim'
call plug#end()

colorscheme minimalist
let g:airline_theme='simple'

# set spell spelllang=es
set number
