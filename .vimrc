" .vimrc
" Reece Hughes


" Vundle Setup

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Vundle Plugins

Plugin 'trusktr/seti.vim'

" File Navigation
" Plugin 'scrooloose/nerdtree'

" Syntax and Error Checking
Plugin 'vim-syntastic/syntastic'

" Git
"Plugin 'tpope/vim-fugitive'

" Airline Status Bar
Plugin 'vim-airline/vim-airline'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Editing

" Enable syntax hilighting
syntax enable

colorscheme seti

" Show line numbers
set number
set tabstop=4
set expandtab
set smarttab
set autoindent
" Enable the mouse in all modes
set mouse=a
" Fixes common backapace problems
set backspace=indent,eol,start
" Allows scrolling past the last line.
set scrolloff=20
" Ignore case in search
set ignorecase
" Incremental Search
set incsearch
" Highlight matching searches
set hlsearch

set shiftwidth=4
autocmd FileType javascript,xhtml,html,scss set shiftwidth=2
autocmd FileType ruby set shiftwidth=2
autocmd FileType gitcommit set spell
autocmd FileType markdown set spell

" NERDTree
" autocmd vimenter * NERDTree | wincmd p
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Syntastic Settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']

" Fix airline symbols on version 0.11+
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.linenr = ' ☰  '
" Column nmuber can also be changed if preffered.
" let g:airline_symbols.colnr = ': '

" Set the cliboard to the system clipbboard (ctrl+c/v in other apps)
" Should be unnamedplus for Linux, and unnamed for Mac/Windows.
set clipboard=unnamedplus
