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

" Nice vim colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jdkanani/vim-material-theme'
Plugin 'dracula/vim'
Plugin 'wmvanvliet/vim-blackboard'

" Editor config
Plugin 'editorconfig/editorconfig-vim'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'maksimr/vim-jsbeautify'

" snakemake
Plugin 'ibab/vim-snakemake'

" Default status line
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Emmet
Plugin 'mattn/emmet-vim'

" Surround
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

" Python indentation
Plugin 'vim-scripts/indentpython.vim'

" Distraction free writing
Plugin 'mikewest/vimroom'
let g:vimroom_background='gray'
let g:vimroom_clear_line_numbers=0

" R syntax
Plugin 'jalvesaq/R-Vim-runtime'
Plugin 'vim-scripts/Vim-R-plugin'
let r_indent_ess_compatible = 0

" Don't replace underscore with assignment
let vimrplugin_assign=0

"filetype plugin indent on

" Python indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" Markdown stuff
au BufNewFile,BufRead,FileType markdown
    \ set wrap |
    \ set linebreak |
    \ set nolist |
    \ set syntax=markdown

" tsv
au BufNewFile,BufRead *.tsv
    \ set autoindent |
    \ set noexpandtab |
    \ set tabstop=4 |
    \ set shiftwidth=4

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
colorscheme blackboard

" Use line numbers
set number

set t_Co=256
set enc=utf-8
set fillchars+=stl:\ ,stlnc:\

" Show ruler at 72 chars
" set colorcolumn=72

" Highlight the line where the cursor is
set cursorline

" Note settings
let g:notes_directories = ['~/Dropbox/Notes']
let g:notes_conceal_italic = 1

" Crontab
if $VIM_CRONTAB == 1
    set nobackup
    set nowritebackup
endif
