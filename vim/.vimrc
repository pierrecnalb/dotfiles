" ----------------------------------------------------------------------------
"   Plugins manager
" ----------------------------------------------------------------------------
" download the plug.vim from https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" and add it to ~/.vim/autoload/plug.vim
" use :PlugInstall to start the installation

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'      " Syntastic: Code linting errors
Plug 'tpope/vim-unimpaired'         " Pairs of handy bracket mappings
Plug 'vim-airline/vim-airline'      " Fancy statusline
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'           " Fuzzy file opener
Plug 'tpope/vim-commentary'         " Make commenting easier using gcc
Plug 'scrooloose/nerdtree'          " Navigate files in a sidebar
Plug 'tpope/vim-surround'           " Change brackets and quotes

call plug#end()

" ----------------------------------------------------------------------------
"   GENERAL OPTIONS
" ----------------------------------------------------------------------------
set nocompatible           " Use Vim settings, rather than Vi settings
let mapleader="\<Space>"   " Set the leader key to <space> instead of \
set foldmethod=marker
filetype on
filetype plugin on
filetype indent on      " load filetype-specific indent files
set autoread            " READ CHANGES DONE BY OTHER PROGRAMS ON THE SAME FILE
set backspace=indent,eol,start "fix backspace key issue.

" Set the defaults encoding and fileformats.
set encoding=utf8
set ffs=unix,dos

" ----------------------------------------------------------------------------
"   COLORS
" ----------------------------------------------------------------------------
syntax enable           " enable syntax processing
set t_Co=256            " enable 256 colors
colorscheme molokai

" ----------------------------------------------------------------------------
"   UI
" ----------------------------------------------------------------------------
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set wildmenu            " visual autocomplete for command menu
set wildmode=longest,full " Set the option of the command line completion.
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set sessionoptions+=resize,winpos
let python_highlight_all = 1 " Put all the python highlightings on.
set laststatus=2        " always display status bar

" Set font and window size and position when GUI is running.
if has("gui_running")
  set guifont=Source\ Code\ Pro\ Medium
  " set lines=60 columns=132
  set lines=60 columns=157
  winpos 785 0
endif

" SPACES AND TABS
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Indents will have a width of 4.
set expandtab       " tabs are spaces

" Toggle Menu and Toolbar with F2.
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

" ----------------------------------------------------------------------------
"   SEARCH
" ----------------------------------------------------------------------------
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
nnoremap <leader><leader> :nohlsearch<CR> " stop highlighting old search with \<space>

" ----------------------------------------------------------------------------
"  FOLDING
" ----------------------------------------------------------------------------
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za " space open/closes folds
set foldmethod=indent   " fold based on indent level

" ----------------------------------------------------------------------------
"   PLUGINS CONFIG
" ----------------------------------------------------------------------------
" CTRL P
let g:ctrlp_match_window = 'bottom,order:ttb' "order matching files top to bottom
let g:ctrlp_switch_buffer = 0 "always open files in new buffers
"let g:ctrlp_working_path_mode = 0 "change working dir during session
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' 

let g:airline_theme='molokai'

nmap <F8> :TagbarToggle<CR>

" ----------------------------------------------------------------------------
"   BACKUPS
" ----------------------------------------------------------------------------
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
