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

set relativenumber

let mapleader=","

" Set realtime for GitGutter
set updatetime=250

" Set UTF-8 encoding
set encoding=utf8

" Powerline vim setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from selecta on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
" let find_command = "find * -type f"
" let find_command = "find $(git rev-parse --show-toplevel) -name '.git' -prune -o  -type f"
"
" Filter out .git and virtualenv dirs. Then reduce the long paths by replacing
" pwd with nothing so that the path is converted from abspath to relpath.
let find_command = "find $(git rev-parse --show-toplevel) 
    \ -name '.git' -prune -o 
    \ -name 'env' -prune -o 
    \ -name 'node_modules' -prune -o
    \ -name '.DS_Store' -prune -o
    \ -name '__pycache___' -prune -o
    \ -type f | sed 's?'`pwd`/'??'"

nnoremap <leader>t :call SelectaCommand(find_command, "", ":e")<cr>
