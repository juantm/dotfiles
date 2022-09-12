set nocompatible
set encoding=UTF-8
set relativenumber
set number
set tabstop=2 shiftwidth=2 expandtab
set incsearch
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif
" set hlsearch
set backspace=indent,eol,start

if &laststatus < 2
  set laststatus=2
endif
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:.,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
" Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree' |
      \ Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

if has('gui_running')
  " set guifont=FiraCode_Nerd_Font_Mono:h9:cANSI:qDRAFT
  set guifont=Hack_Nerd_Font_Mono:h9:cANSI:qDRAFT
  colorscheme base16-atelier-plateau-light 
  set background=light
endif

" inoremap {<cr> {<cr>}<C-O><S-O>
" inoremap (<cr> (<cr>)<c-o><s-o>
" inoremap [<cr> [<cr>]<c-o><s-o>
inoremap ( ()<left>
inoremap { {}<left>
inoremap [ []<left>

vnoremap ' <Esc>`<i'<Esc>`>a<right>'<Esc>
vnoremap " <Esc>`<i"<Esc>`>a<right>"<Esc>
vnoremap ( <Esc>`<i(<Esc>`>a<right>)<Esc>
vnoremap { <Esc>`<i{<Esc>`>a<right>}<Esc>
vnoremap [ <Esc>`<i[<Esc>`>a<right>]<Esc>



nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
