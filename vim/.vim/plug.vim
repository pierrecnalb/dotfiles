" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob("~/.vim/autoload/plug.vim"))
    " Ensure all needed directories exist
    execute 'mkdir -p ~/.vim/plugged'
    execute 'mkdir -p ~/.vim/autoload'
    " Download the actual plugin manager
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'captbaritone/molokai'
Plug 'ajh17/spacegray.vim'

" Syntax
Plug 'tpope/vim-git', { 'for': 'git' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Completion
Plug 'mattn/emmet-vim', { 'for': 'html' }

" Make % match xml tags
Plug 'edsono/vim-matchit', { 'for': ['html', 'xml'] }

" Syntastic: Code linting errors
Plug 'vim-syntastic/syntastic'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" Fancy statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" Search files using Silver Searcher
Plug 'rking/ag.vim'

" Make Ag searches of selected text
Plug 'Chun-Yang/vim-action-ag'

" Make commenting easier
Plug 'tpope/vim-commentary'

" Navigate files in a sidebar
Plug 'scrooloose/nerdtree'
"
" Change brackets and quotes
Plug 'tpope/vim-surround'

" Make vim-surround repeatable with .
Plug 'tpope/vim-repeat'
"
" Fugitive: Git from within Vim
Plug 'tpope/vim-fugitive'

" Show git status in the gutter
Plug 'airblade/vim-gitgutter'

" Python completion and tag navigation
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

filetype plugin indent on                   " required!
call plug#end()
