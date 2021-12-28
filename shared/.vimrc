""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.config/nvim/autoload/
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/gruvbox-material'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'

" lang
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'plasticboy/vim-markdown'

call plug#end()
filetype plugin indent on

""""""""""""""""""""""
" misc
""""""""""""""""""""""
set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set clipboard=unnamed
autocmd BufWritePre * :FixWhitespace

cnoremap <c-x> <c-r>=expand('%:p')<cr>

""""""""""""""""""""""
" UI
""""""""""""""""""""""
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
colorscheme gruvbox-material
syntax enable

""""""""""""""""""""""
" Tab
""""""""""""""""""""""
set expandtab

" Tab width
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set autoindent

""""""""""""""""""""""
" Search
""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><ESC>

""""""""""""""""""""""
" Restore cursor position
""""""""""""""""""""""
if has ("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \    exe "normal! g'\"" |
        \ endif
endif

