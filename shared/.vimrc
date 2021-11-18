""""""""""""""""""""""
" Vundle
""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'arcticicestudio/nord-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'

" lsp and completion
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'
Plugin 'mattn/vim-lsp-settings'

" lang
Plugin 'rust-lang/rust.vim'
Plugin 'plasticboy/vim-markdown'

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

