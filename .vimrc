""""""""""""""""""""""
" Vundle
""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'vim-scripts/fcitx.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'

call vundle#end()
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

""""""""""""""""""""""
" UI
""""""""""""""""""""""
set number
set cursorline
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
colorscheme nord
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

"""""""""""""""""""""
" Search
""""""""""""""""""""""
let g:unite_enable_start_insert=1
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>

" split holizontal
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')

" split vertical
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')

" exit on escape twice
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""
" Restore cursor position
""""""""""""""""""""""
if has ("autocmd")
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \    exe "normal! g'\"" |
        \ endif
endif

""""""""""""""""""""""
" Rust
""""""""""""""""""""""
set hidden
let g:racer_cmd = '~/.cargo/bin/racer'
let g:racer_experimental_compiler = 1
