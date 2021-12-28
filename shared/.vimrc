""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.config/nvim/autoload/
call plug#begin('~/.config/nvim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'bronson/vim-trailing-whitespace'
Plug 'godlygeek/tabular'
Plug 'airblade/vim-gitgutter'
" lsp and completion
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'mattn/vim-lsp-settings'

" lang
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
let g:asyncomplete_auto_popup = 1
let g:lsp_virtual_text_enabled = 0
let g:lsp_diagnostics_echo_cursor = 1
let g:rustfmt_autosave = 1

noremap <silent> <M-n> :LspNextDiagnostic<CR>
noremap <silent> <M-p> :LspPreviousDiagnostic<CR>

