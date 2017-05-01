" Vundle setup
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomasr/molokai'
Plugin 'rking/ag.vim' " brew install the_silver_searcher to install Ag
Plugin 'tomtom/tcomment_vim'
Plugin 'mhinz/vim-startify'
Plugin 'posva/vim-vue'
Plugin 'nelsyeung/twig.vim'
Bundle 'wakatime/vim-wakatime'
Plugin 'leafgarland/typescript-vim'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Syntax highlighting
syntax on

colorscheme molokai

" Relative line numbers
set relativenumber

" Autocomplete menu
set wildmenu
set wildmode=list:longest,full

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Better escape
ino kj <esc>
cno kj <C-[>

" Fast saving
nmap <leader>w :w!<cr>
" Fast quitting 
nmap <leader>q :q!<cr>

" Remove arrow key navigation. Earth go hard
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>

" Always show current position
set ruler

" Highlight search results
set hlsearch

" Search for visually selected text
vnoremap // y/<C-R>"<CR>

" Show matching brackets when text indicator is over them
set showmatch

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>te :tabedit<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext
" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Always show the status line
set laststatus=2

" Window management
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>h <C-W>h
map <leader>l <C-W>l
map <leader>s <C-W>s
map <leader>v <C-W>v
map <leader>+ <C-W>>
map <leader>- <C-W><

" NERDTree shortcuts
map <leader>\ :NERDTreeToggle<cr>
" Close vim if NERDTree is the only thing left 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" CtrlP settings
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" tComment settings
map <leader>/ gc

" .json syntax highlighting
autocmd BufNewFile,BufRead *.json set ft=javascript

" .ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" Allow JSX syntax highlighting in .js files
let g:jsx_ext_required = 0 
