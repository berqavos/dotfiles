"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .vimrc 
"
" Last update: Mon 2015-05-25 11:02
"
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"
" !kompatibles Verhalten
set nocompatible

" syntax hervorhebung
syntax on

" zeilennummern
set number

" koordinatenanzeige in statuszeile aktivieren
set ruler
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
set mat=5 " show matching brackets for 0.5 sec

" f..k error noises
set noerrorbells
set visualbell t_vb=

" wrap on theses
set whichwrap+=<,>,[,]

" tab complete menu
set wildmenu

" Spaltenbreite Faltungsanzeige
"set foldcolumn=2
set foldcolumn=0
set foldmethod=syntax
set foldignore=#
set foldtext=foldtext()

" tab to spaces
set expandtab
set tabstop=2
set shiftwidth=2

set t_Co=256

"abbreviate begr berg
" abbreviate ä &auml; 

" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

augroup filetype
autocmd BufNewFile,BufRead */.postponed/* set filetype=mail
autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

autocmd FileType mail,human set formatoptions+=t textwidth=80
"autocmd FileType  set formatoptions+=t textwidth=80
autocmd FileType c,cpp,slang set cindent formatoptions+=ro
autocmd FileType perl set smartindent expandtab
autocmd FileType html,css set noexpandtab tabstop=2 formatoptions+=tl smartindent
autocmd FileType make set noexpandtab shiftwidth=8
    
" Update .*rc header
fun! UpdateRcHeader()
    let l:c=col(".")
    let l:l=line(".")
    1,4s-\(Last update:\).*-\="Last update: ".strftime("%a %Y\-%m\-%d %R")-
    call cursor(l:l, l:c)
endfun

fun! NewFile_Bash()
	call append(0, "#!/usr/bin/env bash")
	call append(1, "#")
	call append(2, "# Date=\"" .strftime("%a %Y\-%m\-%d ")."\"")
	call append(3, "# Author=\"berq\"")
	call append(4, "#")
endfun

"Autcommands ausführen
augroup berg
	autocmd!
	"Header update für rc-files
	autocmd BufWritePre *vimrc :call UpdateRcHeader()
	autocmd BufNewFile *.sh call NewFile_Bash()
augroup END

" spell check
"set spelllang=en_gb
set spellfile=~/.vim/spell.en.add
:map <F5> :setlocal spell! spelllang=en_gb<CR>
"au BufNewFile,BufRead /tmp/mutt*  setf mail
"au BufNewFile,BufRead /tmp/mutt*  set ai et tw=72 spell
":map <F12> :w!<CR>:!aspell --lang=de,en check %<CR>:e! %<CR>
