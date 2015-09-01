""" Plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Sensible defaults
Plugin 'tpope/vim-sensible'

" Let vundle manage vundle
Plugin 'gmarik/vundle'

" This plugin automatically reloads changed vim scripts in the current vim
" session.
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-reload'

" Nice vim colorscheme
Plugin 'altercation/vim-colors-solarized'

" Default status line
Plugin 'bling/vim-airline'

" Powerline fonts
Plugin 'powerline/fonts'

filetype plugin indent on

""" General config

" Don't use swap files
set noswapfile

" Flash instead of beep
set visualbell

" Tab settings
set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set smarttab
filetype indent plugin on

""" Appearance
syntax enable
"let g:solarized_termcolors = 256
"let g:solarized_termtrans = 1
set background=dark
colorscheme solarized

" Show ruler at 72 chars
set colorcolumn=72

" Use line numbers
set number

" Highlight the line where the cursor is
set cursorline

" Airline settings
let g:airline_powerline_fonts = 1
