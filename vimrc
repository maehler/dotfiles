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

" Auto pairing of brackets
Plugin 'jiangmiao/auto-pairs'

" Nice vim colorscheme
Plugin 'altercation/vim-colors-solarized'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

" Default status line
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim'}

" Powerline fonts
Plugin 'powerline/fonts'

" Emmet
Plugin 'mattn/emmet-vim'

" R syntax
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'vim-scripts/Vim-R-plugin'
" Don't replace underscore with assignment
let vimrplugin_assign=0

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
set background=dark
colorscheme solarized

set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h14
let g:Powerline_symbols = 'fancy'
set t_Co=256
set enc=utf-8
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color

if has("gui_running")
    let s:uname = system("uname")
    if s:uname == "Darwin\n"
        set guifont=Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline:h14
    endif
endif

" Show ruler at 72 chars
set colorcolumn=72

" Use line numbers
set number

" Highlight the line where the cursor is
set cursorline
