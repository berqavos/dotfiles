"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" .vimrc 
"
" Last update: Mon 2014-11-10 21:54
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

" abbreviate ä &auml; 
set fileencoding=utf-8
set encoding=utf-8

" enable filetype detection:
filetype on
filetype indent on
filetype plugin on

augroup filetype
autocmd BufNewFile,BufRead */.postponed/* set filetype=mail
autocmd BufNewFile,BufRead *.txt set filetype=human
augroup END

autocmd FileType mail,human set formatoptions+=t textwidth=100
autocmd FileType c,cpp,slang set cindent formatoptions+=ro
autocmd FileType perl set smartindent expandtab
autocmd FileType html,css,php,js set expandtab shiftwidth=2 smartindent formatoptions+=tl
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
augroup bq 
	autocmd!
	"Header update für rc-files
	autocmd BufWritePre *vimrc :call UpdateRcHeader()
	autocmd BufNewFile *.sh call NewFile_Bash()
augroup END

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

"set foldmethod=syntax
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set foldtext=foldtext()
set foldcolumn=2
set foldcolumn=0
set foldignore=#

" spell check
"set spelllang=de,en
"set spellfile=~/.vim/spell.de.add
"au BufNewFile,BufRead /tmp/mutt*  setf mail
"au BufNewFile,BufRead /tmp/mutt*  set ai et tw=72 spell
":map <F12> :w!<CR>:!aspell --lang=de,en check %<CR>:e! %<CR>
