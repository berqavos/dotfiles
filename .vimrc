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
set shiftwidth=2    " when reading, tabs are 2 spaces
set softtabstop=2   " in insert mode, tabs are 2 spaces
set tabstop=2   " in insert mode, tabs are 2 spaces
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
set foldmethod=indent
set foldlevel=99
"set foldignore=#
"set foldtext=foldtext()
" Enable folding with the spacebar
nnoremap <space> za

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" use <C-Space> for Vim's keyword autocomplete
"  ...in the terminal
inoremap <Nul> <C-n>

" enable filetype detection:
filetype plugin indent on
syntax on
let python_highlight_all=1
set t_Co=256
colorscheme elflord
"colorscheme zenburn

au BufNewFile,BufRead *.yml,*.yaml,*.js,*.md,*.markdown 
\ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent fileformat=unix

au BufNewFile,BufRead *.py 
\ setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79 expandtab autoindent fileformat=unix

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,config.ru,*.rake} set ft=ruby

" Flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.yml,*.js,*.md match BadWhitespace /\s\+$/

command Yamllint !yamllint %
nnoremap <leader>l :Yamllint<cr>

" minibuf
map <C-m> :MBEToggle<CR>

" youcompleteme
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" map FuzzyFinder
noremap <leader>f :FZF<cr>

" first go to the previous buffer, then delete the last buffer
nnoremap <leader>q :w\|bd<cr>

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')
"Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'vim-scripts/L9'
Plug 'vim-scripts/yaml.vim'
Plug 'vim-scripts/Jinja'
Plug 'Rykka/riv.vim'
"Plug 'itchyny/lightline.vim'      
"Plug 'Lokaltog/vim-easymotion'    
"Plug 'tpope/vim-surround'  
"Plug 'SirVer/ultisnips'
"Plug 'majutsushi/tagbar'
Plug 'fholgado/minibufexpl.vim'
Plug 'tpope/vim-fugitive'  
Plug 'avakhov/vim-yaml'
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
Plug 'jnurmine/Zenburn'
Plug 'Valloric/YouCompleteMe'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Initialize plugin system
call plug#end()

