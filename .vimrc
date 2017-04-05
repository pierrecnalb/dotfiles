" My vimrc file based on the vimrc example from Bram Moolenar
" and various tricks from here and there.
"
" Maintainer:   Pierre Blanc
" Last change:  2012 Mar 07
"

" Fisrt make sure that this file has the correct folding method.
set foldmethod=marker

" Then make sure to use English messages and help.
set helplang=en
if has('win32')
    language message en
endif

" PLUGINS MANAGEMENT
" Use the vundle plugin to manage all the installed plugins.
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax enable           " enable syntax processing




" UI CONFIG
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype on
filetype plugin on
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set wildmode=longest,full " Set the option of the command line completion.
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set sessionoptions+=resize,winpos
let python_highlight_all = 1 " Put all the python highlightings on.
colorscheme molokai

set laststatus=2

" SPACES AND TABS
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " Indents will have a width of 4.
set expandtab       " tabs are spaces

" Set font and window size and position when GUI is running.
if has("gui_running")
  set guifont=Source\ Code\ Pro\ Medium
  " set lines=60 columns=132
  set lines=60 columns=157
  winpos 785 0
endif

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

" SEARCHING
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase
set smartcase
nnoremap <leader><space> :nohlsearch<CR> " stop highlighting old search with \<space>

" FOLDING
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za " space open/closes folds
set foldmethod=indent   " fold based on indent level

" CTRL P
let g:ctrlp_match_window = 'bottom,order:ttb' "order matching files top to bottom
let g:ctrlp_switch_buffer = 0 "always open files in new buffers
"let g:ctrlp_working_path_mode = 0 "change working dir during session
"let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""' 

" BACKUPS
"set backup
"set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set backupskip=/tmp/*,/private/tmp/*
"set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
"set writebackup

"  MAPPING AND SHORTCUTS 
" Commenting and uncommenting functions, same mapping as in visual studio.
function! Comment()
    if &ft == 'python' || &ft == 'sh' || &ft == 'gnuplot' || &ft == 'conf'
        s/^\(\s*\)/\1# /
    elseif &ft == 'vim'
        s/^\(\s*\)/\1" /
    elseif &ft == 'cpp' || &ft == 'javascript'
        s/^\(\s*\)/\1\/\/ /
    elseif &ft == 'c' || &ft == 'css' || &ft == 'php'
        s/^\(\s*\)\(.*\)$/\1\/* \2 *\//
    elseif &ft == 'lisp' || &ft == 'scheme'
        s/^\(\s*\)/\1;; /
    elseif &ft == 'tex'
        s/^\(\s*\)/\1% /
    endif
endfunction
map <silent> <C-k><C-k> :call Comment()<CR>

" Note that the 'e' option of the substitute command means
" 'don't break command if no search string found'.
function! Uncomment()
    if &ft == 'python' || &ft == 'sh' || &ft == 'gnuplot' || &ft == 'conf'
        s/^\(\s*\)\(#\s*\)/\1/e
    elseif &ft == 'vim'
        s/^\(\s*\)\("\s*\)/\1/e
    elseif &ft == 'cpp' || &ft == 'javascript'
        s/^\(\s*\)\(\/\/\s*\)/\1/e
    elseif &ft == 'c' || &ft == 'css' || &ft == 'php'
        s/^\(\s*\)\/\*\s*\(.*\)\s*\*\/$/\1\2/e
    elseif &ft == 'lisp' || &ft == 'scheme'
        s/^\(\s*\)\(;;\s*\)/\1/e
    elseif &ft == 'tex'
        s/^\(\s*\)\(%\s*\)/\1/e
    endif
endfunction
map <silent> <C-k><C-u> :call Uncomment()<CR>

" Remap code completion to Ctrl+N and Ctrl+Space. 
"inoremap <C-Space> <C-n>

" ENCODING
" Set the defaults encoding and fileformats.
set encoding=utf8
set ffs=unix,dos

" CTAGS
set tags+="C:\\Program Files (x86)\\ctags58"
set rtp+="C:\Program Files (x86)\ctags58"
function! GenerateTagsIncrementally()
python << EOF
import os
print('Generating tags incrementally.')
# Walk the file tree, if a file has an mtime more recent than the tag file,
# add it to the list of files to index.
tags_mtime = os.stat('tags').st_mtime
with open('list', 'w') as fp:
    for dirpath, dirnames, filenames in os.walk(os.getcwd()):
        for filename in filenames:
            full_path = os.path.join(dirpath, filename)
            if os.stat(full_path).st_mtime > tags_mtime:
                fp.write(full_path + '\n')
                # print(full_path) # Files to be indexed.

# Run ctags using the created list of files.
os.system('ctags --recurse --verbose --append --extra=+q --fields=+aimS --c-kinds=+p --c++-kinds=+p -L list')
os.remove('list')
EOF
endfunction
command GenerateTagsIncrementally call GenerateTagsIncrementally()

"nmap <F8> :TagbarToggle<CR>


" RANDOM
set autoread " READ CHANGES DONE BY OTHER PROGRAMS ON THE SAME FILE
set backspace=indent,eol,start "fix backspace key issue.
