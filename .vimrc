" if starting in console (no X11 or other gui) turn on desert.
if !has($DISPLAY)
    colorscheme desert
endif

" First, turn off the single quote in autoclose. I use double quotes for
" matches anyway.
let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"'} 
"
"""""General Settings"""""
"
" Really basic stuff. Should be universal.
set nocompatible
set mouse=a
" turn off for mac
"set t_Co=256
filetype plugin on
filetype indent on
set hid " change buffer and move with out saving

" compiler settings
" compiler gcc

" fold settings
set foldmethod=manual
set foldnestmax=1
set nofoldenable
set foldlevel=1

" Menu settings
set wildmenu
set wildmode=list:longest,full

"""""Fortran Settings"""""" 
" Fix the default formatting. I almost never used fixed source.
let s:extfname = expand("%:e")
if s:extfname ==? "f90" || "f95" || "f03" || "f08" || "F90" || "F95" || "F03" || "mod"
    let fortran_free_source=1
    unlet! fortran_fixed_source
else
    let fortran_fixed_source=0
    unlet! fortran_free_source
endif

" Changing the display. No editing functionality, but makes it nicer.
set incsearch " highlights what you search for as you type
set scrolloff=4 " keeps text around current position
set number
syntax on
set ruler
set showmatch " show matching braces
set mat=2 " blink for that many tenths of seconds!
set showcmd " shows what you type
highlight Pmenu ctermbg=238 gui=bold " set the autocomplete box to legible
" gui stuff
if has('gui_running')
    colorscheme darkburn
    set gfn=Inconsolata\ Medium\ 12
    " NO ONE LIKES BUTTONS
    set guioptions-=aegimrLtT
endif

" Now get indentation right.
set cinwords=if,else,while,do,for,switch,case,function,elif,class
set textwidth=79
set tabstop=4
set shiftwidth=4
set smarttab " will move by 4 spaces, as set above
set expandtab
set autoindent

"""""LaTeX Settings"""""" 
" Vim is weird and screws this up if it is not run before autocommands.
let g:tex_flavor='latex'

""""Auto Commands: These are for new buffers so they can run several times""""
autocmd BufRead,BufNewFile *.sage set filetype=python
autocmd BufRead,BufNewFile *.geo set filetype=gmsh
autocmd BufRead,BufNewFile *.mac set filetype=maxima
autocmd BufRead,BufNewFile,FileReadPost set ff=unix
autocmd BufRead,BufNewFile pentadactyl-localhost.tmp source ~/.vim/python.vim
autocmd BufRead,BufNewFile pentadactyl-localhost.tmp set filetype=python
" autocmd BufRead,BufNewFile *.m set makeprg={/home/dave/MATLAB_INSTALL/bin/glnxa64/mlint}

"""""Auto Commands; only execute once!"""""
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    " check the folder ~/.vim/skel/ for templates
    " autocmd BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e
    " set correct mode
    autocmd BufRead,BufNewFile,FileReadPost *.sage source ~/.vim/python.vim
    autocmd BufRead,BufNewFile,FileReadPost *.py source ~/.vim/python.vim
    autocmd BufRead,BufNewFile,FileReadPost *.scm source ~/.vim/scheme.vim
    autocmd BufRead,BufNewFile,FileReadPost *.chpl source ~/.vim/chpl.vim
    autocmd BufRead,BufNewFile,FileReadPost *.tex source ~/.vim/latex.vim
    autocmd BufRead,BufNewFile,FileReadPost *.gnuplot source ~/.vim/gnuplot.vim
    autocmd BufRead,BufNewFile,FileReadPost *.hs source ~/.vim/haskell.vim
    autocmd BufRead,BufNewFile,FileReadPost *.ly source ~/.vim/lilypond/lilypond.vim
    autocmd BufRead,BufNewFile,FileReadPost *.clj set filetype=clojure
    autocmd BufRead,BufNewFile,FileReadPost *.clj source ~/.vim/clojure.vim
    autocmd BufRead,BufNewFile,FileReadPost *.cl source ~/.vim/cl.vim
endif
