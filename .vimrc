set nocompatible
set number
set ruler
set fileencoding=utf-8
set encoding=utf-8
set showmode
set showcmd
set incsearch
set ignorecase
set smartcase
set hlsearch
set showmatch
set noerrorbells
set visualbell t_vb=
set whichwrap+=<,>,[,]
set wildmenu
set wildmode=list:longest,full
set expandtab       " use spaces instead of tabs
set autoindent      " autoindent based on line above, works most of the time
set smartindent     " smarter indent for C-like languages
set shiftwidth=4    " when reading, tabs are 4 spaces
set softtabstop=4   " in insert mode, tabs are 4 spaces
set textwidth=80
set laststatus=2    " needed for lightline status
" don't unload buffers, instead stay in the background
" http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
set hidden
set autoread " auto re-read file if it has changed

" Spaltenbreite Faltungsanzeige
"set foldcolumn=2
"set foldcolumn=0
"set foldmethod=syntax
"set foldignore=#
"set foldtext=foldtext()

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>

filetype off
" --- PLUGIN CONFIGURATION ---

"initiate Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" start plugin defintion
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-scripts/yaml.vim'
Plugin 'itchyny/lightline.vim'      
Plugin 'Lokaltog/vim-easymotion'    
Plugin 'tpope/vim-surround'         
call vundle#end()            " required for vundle

" --- PLUGIN CONFIGURATION END ---

" enable filetype detection:
filetype plugin indent on
syntax on
set t_Co=256

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Go Syntax Stuff
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_list_type = "quickfix"

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>
