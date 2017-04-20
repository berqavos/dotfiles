set nocompatible
"set number
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
"set textwidth=80
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

" enable filetype detection:
filetype plugin indent on
syntax on
set t_Co=256
colorscheme elflord

" yaml
au FileType yaml setl sw=2 sts=2 et
au FileType yml setl sw=2 sts=2 et

command Yamllint !yamllint %
nnoremap <leader>l :Yamllint<cr>

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" map FuzzyFinder
noremap <leader>b :FufBuffer<cr>
noremap <leader>f :FufFile<cr>

" first go to the previous buffer, then delete the last buffer
nnoremap <leader>q :w\|bd<cr>

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'vim-scripts/L9'
Plug 'vim-scripts/FuzzyFinder'
Plug 'vim-scripts/yaml.vim'
Plug 'vim-scripts/Jinja'
Plug 'Rykka/riv.vim'
Plug 'itchyny/lightline.vim'      
Plug 'Lokaltog/vim-easymotion'    
Plug 'tpope/vim-surround'  

" Initialize plugin system
call plug#end()

