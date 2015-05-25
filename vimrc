"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .vimrc
"
" Last update: Mon 2015-05-25
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" !kompatibles Verhalten
set nocompatible

" syntax hervorhebung
syntax on
set t_Co=256

" zeilennummern
set number

" koordinatenanzeige in statuszeile aktivieren
set ruler

"abbreviate begr berg
" abbreviate ä &auml; 
set fileencoding=utf-8
set encoding=utf-8

"Modi anzeigen
set showmode
set showcmd

"Inkrm. Suche
set incsearch
" !case-sensetive || der Begriff hat Großbuchstaben
set ignorecase
set smartcase
" highlight search
set hlsearch

" Zeige Klammern oeffnend & schlieszend
set showmatch

" f..k error noises
set noerrorbells
set visualbell t_vb=

" wrap on theses
set whichwrap+=<,>,[,]

" tab complete menu
set wildmenu

" Spaltenbreite Faltungsanzeige
set foldcolumn=2
set foldcolumn=0
set foldmethod=syntax
set foldignore=#
set foldtext=foldtext()

" pathogen
execute pathogen#infect()

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

" NerdTree
"autocmd vimenter * NERDTree
" spell check
"set spelllang=de,en
:map <F5> :setlocal spell! spelllang=en_gb<CR>
set spellfile=~/.vim/spell.en.add
"au BufNewFile,BufRead /tmp/mutt*  setf mail
"au BufNewFile,BufRead /tmp/mutt*  set ai et tw=72 spell
":map <F12> :w!<CR>:!aspell --lang=de,en check %<CR>:e! %<CR>

augroup filetype
autocmd BufNewFile,BufRead */.postponed/* set filetype=mail
autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

autocmd FileType mail,human set formatoptions+=t textwidth=72
autocmd FileType c,cpp,slang set cindent
autocmd FileType c set formatoptions+=ro
autocmd FileType perl set smartindent
autocmd FileType perl set expandtab
autocmd FileType css set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType html,css set noexpandtab tabstop=2
autocmd FileType make set noexpandtab shiftwidth=8
autocmd FileType rst set noexpandtab tabstop=2

" Update .*rc header
fun! UpdateRcHeader()
    let l:c=col(".")
    let l:l=line(".")
    1,4s-\(Last update:\).*-\="Last update: ".strftime("%a %Y\-%m\-%d")-
    call cursor(l:l, l:c)
endfun

fun! NewFile_Bash()
	call append(0, "#!/usr/bin/env bash")
	call append(1, "############")
	call append(2, "# Date=\"" .strftime("%a %Y\-%m\-%d")."\"")
	call append(3, "# Author=\"berq\"")
	call append(4, "############")
endfun

"Autcommands ausführen
augroup berg
	autocmd!
	"Header update für rc-files
	autocmd BufWritePre *vimrc :call UpdateRcHeader()
	autocmd BufNewFile *.sh call NewFile_Bash()
augroup END
