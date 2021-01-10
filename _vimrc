syntax on
filetype plugin indent on

" Vimscript file settings -------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

set encoding=utf-8
set number
set autoindent
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set foldmethod=indent

set wildmenu
set wildmode=list:longest,full

set clipboard=unnamed,unnamedplus

let g:plug_timout = 300
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe', {'do':'./install.py'}
Plug 'vim-airline/vim-airline' 

call plug#end()

autocmd VimEnter * NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowBookmarks = 1

set termguicolors
colorscheme gruvbox 

let g:ctrlp_working_path_mode = 'ra'

set tags=tags;
autocmd BufWritePost *.cpp silent! !ctags -R &

nnoremap <SPACE> <Nop>
let mapleader = " "

"map
"nmap
"imap
"vmap
"omap

"noremap
nnoremap <leader>t :term<CR><C-w>J<C-w>:res 10<CR>
noremap <leader><tab> <C-w>w
noremap <leader>ev :split $MYVIMRC<CR>
noremap <leader>sv :source $MYVIMRC<CR>
"inoremap
"vnoremap
"onoremap
iabbrev @@ quanyongh@foxmail.com

if has('gui_running')
    set guifont=Source_Code_Pro_for_Powerline
endif
