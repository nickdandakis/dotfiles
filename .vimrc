set nocompatible              " be iMproved, required
filetype off                  " required

" vim-plug setup
call plug#begin('~/.vim/plugged')

" plugins go here
" file tree
" Plug 'scrooloose/nerdtree'
" status line
Plug 'bling/vim-airline'
" git sidebar
Plug 'airblade/vim-gitgutter'
" github copilot code completions
Plug 'github/copilot.vim'
" linting
Plug 'dense-analysis/ale'
" theme
Plug 'tomasr/molokai'
" fuzzy finder: brew install bat, ripgrep, fzf
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
" smarter commenting
Plug 'tomtom/tcomment_vim'
" smarter time tracking
Plug 'wakatime/vim-wakatime'
" vue file support
Plug 'posva/vim-vue'
" twig file support
Plug 'nelsyeung/twig.vim'
" smarter surroundings editing
Plug 'tpope/vim-surround'
" TS file support
Plug 'leafgarland/typescript-vim'
" JS file support
Plug 'yuezk/vim-js'
" JSX file support
Plug 'MaxMEllon/vim-jsx-pretty'
" GLSL file support
Plug 'tikhomirov/vim-glsl'
 " svelte file support
Plug 'evanleck/vim-svelte'
Plug 'neovim/nvim-lspconfig'
Plug 'stevearc/oil.nvim'

" All of your Plugins must be added before the following line
call plug#end()
" Put your non-Plugin stuff after this line

" Syntax highlighting
syntax on

" enable installed theme
colorscheme molokai

" Relative line numbers
set relativenumber
set nu

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

" Enable fzf in vim
set rtp+=/opt/homebrew/opt/fzf

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
" map <leader>\ :NERDTreeToggle<cr>
" Close vim if NERDTree is the only thing left 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" bind fzf to fuzzy search files on ctrl+p
nmap <C-P> :FZF<CR>
" bind fzf to fuzzy search text on ctrl+f
nmap <C-F> :Rg<CR>
" Customize fzf popup window (anchored to the bottom of the current window)
let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.33, 'relative': v:true, 'yoffset': 1.1 } }
" Customize fzf colors to match the existing theme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
" make Rg search more useful
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" tComment settings
map <leader>/ gc

" .ejs syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" .svx syntax highlighting
au BufNewFile,BufRead *.svx set filetype=markdown shiftwidth=2

" Allow JSX syntax highlighting in .js files
let g:jsx_ext_required = 0 
let g:vim_jsx_pretty_colorful_config = 1

" Ignore files in NERDTree
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']

" avoid layout jank when ALE complains
let g:ale_sign_column_always = 1
" ALE auto-complete
let g:ale_completion_enabled = 1
