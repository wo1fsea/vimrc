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

" vim-plugin -------------------- {{{
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
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'

call plug#end()
"}}}

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

" gVim 设置 -------------------- {{{

if has('gui_running')
    if has('macunix')
        set guifont=SourceCodeProForPowerline-Medium:h12
    endif

    if has('win32')
        " 设置文件编码格式
        set encoding=utf-8
        set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
        set fileencoding=utf-8

        "解决菜单乱码 删除菜单，再重新添加菜单，vim会按照之前设定的编码格式创建菜单栏
        source $VIMRUNTIME/delmenu.vim
        source $VIMRUNTIME/menu.vim

        "解决consle提示信息输出乱码
        language messages zh_CN.utf-8

        "设置gvim隐藏菜单栏，工具栏，滚动条
        :set guioptions-=m  "remove menu bar
        :set guioptions-=T  "remove toolbar
        :set guioptions-=r  "remove right-hand scroll bar
        :set guioptions-=L  "remove left-hand scroll bar
        set guifont=Consolas:h11:cANSI:qDRAFT 
    endif
endif

"}}}
