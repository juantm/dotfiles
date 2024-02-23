" >_ Customizations for the vim editor. Read more at https://github.com/dawsbot/vimrc-builder

set number " Show absolute line numbers on the left.
filetype plugin on " Auto-detect un-labeled filetypes
set relativenumber " Show relative line numbers on the left. These change based upon where your cursor is.
syntax on " Turn syntax highlighting on
set ai " Sets auto-indentation
set si " Sets smart-indentation
set noswapfile " Prevent vim from creating .swp files
set cursorline " Highlight current cursor line
" set cursorcolumn " Highlight current cursor column
set tabstop=2 " Tab equal 2 spaces (default 4)
set shiftwidth=2 " Arrow function (>>) creates 2 spaces
set expandtab " Use spaces instead of a tab charater on TAB
set smarttab " Be smart when using tabs
set wrap " Wrap overflowing lines
set hlsearch " When searching (/), highlights matches as you go
set incsearch " When searching (/), display results as you type (instead of only upon ENTER)
set ignorecase " When searching (/), ignore case entirely
set smartcase " When searching (/), automatically switch to a case-sensitive search if you use any capital letters
set cmdheight=2 " Set height of the command bar to 2
set ttyfast " Boost speed by altering character redraw rates to your terminal
set showmatch " Show matching brackets when text indicator is over them
set noerrorbells " Silence the error bell
set novisualbell " Visually hide the error bell
set foldcolumn=3 " Place a width 1 margin on the left
set encoding=utf8 " Set text encoding as utf8
set numberwidth=8 " Sets width of the 'gutter' column used for numbering to 3 (default 4)
set clipboard=unnamed " Use the OS clipboard by default
set noendofline " No end-of-line character
set shiftround " Shift to the next round tab stop. Aka When at 3 spaces, hit >> to go to 4, not 5 if your shiftwidth is set to 2.

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
" Plug 'valloric/youcompleteme'
call plug#end()

if has("gui_running")
  set guifont=JetBrainsMonoNL Nerd Font:h18
endif
