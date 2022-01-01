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
Plug 'junegunn/fzf', {'dir': '~/.fzf_bin', 'do': './install --all'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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
set mouse=a
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

""""""""""""""""""""""
" coc.nvim
""""""""""""""""""""""
let g:coc_global_extensions = ['coc-git', 'coc-fzf-preview', 'coc-lists', 'coc-pairs']

let g:mapleader = "\<Space>"
nnoremap [dev]    <Nop>
xnoremap [dev]    <Nop>
nmap     m        [dev]
xmap     m        [dev]
nnoremap [ff]     <Nop>
xnoremap [ff]     <Nop>
nmap     z        [ff]
xmap     z        [ff]

nmap     <silent> [dev]rn <Plug>(coc-rename)
nmap     <silent> [dev]a  <Plug>(coc-codeaction-selected)iw

""""""""""""""""""""""
" fzf-preview
""""""""""""""""""""""
nnoremap <silent> <C-p>  :<C-u>CocCommand fzf-preview.FromResources buffer project_mru project<CR>
nnoremap <silent> [ff]s  :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [ff]gg :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [ff]b  :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap          [ff]f  :<C-u>CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>
xnoremap          [ff]f  "sy:CocCommand fzf-preview.ProjectGrep --add-fzf-arg=--exact --add-fzf-arg=--no-sort<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"

nnoremap <silent> [ff]q  :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> [ff]r  :<C-u>CocCommand fzf-preview.CocReferences<CR>
nnoremap <silent> [ff]d  :<C-u>CocCommand fzf-preview.CocDefinition<CR>
nnoremap <silent> [ff]t  :<C-u>CocCommand fzf-preview.CocTypeDefinition<CR>


""""""""""""""""""""""
" nvim treesitter
""""""""""""""""""""""
lua <<EOF
require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
  },
}
EOF

""""""""""""""""""""""
" vim-markdown
""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

