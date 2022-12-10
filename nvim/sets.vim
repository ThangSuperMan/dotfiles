set nocompatible               " be iMproved

set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8

" Searching to the sub dicrectory with find command
set path+=**

" set list 
" set listchars=tab:┆·,trail:·,precedes:,extends:

set wildignore+=*_build/*
set wildignore+=**/node_modules/*

set backspace=2

" Allow neovim title file adapted to the title of terminal
set title
set inccommand=split

" Show the tabline when at lease two tab open
" set showtabline=2
set showtabline=1

set ignorecase
set smartcase

set noshowmode " Turn off the insert mode
set shortmess+=c

set cmdheight=1
set showmatch

set formatoptions-=cro

" enable your mouse
set mouse=a

" Faster completion
set updatetime=300

set t_Co=256

" Set cursor to Always be block. 
" set guicursor=

" always show statusline
set laststatus=2

" set timeoutlen=800

set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab

set encoding=UTF-8
" set cursorline
set nowrap "No Wrap lines

set number
set relativenumber
set signcolumn=yes:1

" turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb
set noswapfile
set nobackup

set scrolloff=10

" always copy to clipboard
set clipboard=unnamed
