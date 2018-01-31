" Pathogen
execute pathogen#infect()

" Enter current millenium
set nocompatible

" Show syntax highlighting
syntax on
filetype plugin indent on

" let the mouse resize splits
set mouse=n

" Set tab size to four spaces
set number
set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set winfixwidth

" Set realtime for GitGutter
set updatetime=250

" Set custom ignore for Ctrl-P
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Make sure NERDTree always keeps to the left
" let g:NERDTreeWinPos = "left"

" Set UTF-8 encoding
set encoding=utf8

" Make every file split to the right
set splitright

" Powerline vim setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
