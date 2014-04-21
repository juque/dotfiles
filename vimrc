" mi vimrc
" 20.mar.2012 22:40:04

" Enable loading filetype and indentation plugins                                   
filetype plugin on                                                                  
filetype indent on

" porque esto es vim
set nocompatible

" prende la sintaxis 
syntax on

" esquema de colores
colorscheme solarized  

" no pierdas cambios, auto graba
set autowrite

" directorio de temporales
set directory=/tmp

" directorio de respaldos
set backupdir=/tmp

" directorio del deshacer 
set undodir=~/.vim/undodir

" codificación por defecto
set encoding=utf-8

" fuente por defecto
" set guifont=Inconsolata:h22
set guifont=Inconsolata:h18

" Permite backspacing sobre cualquier cosa
" set backspace=indent,eol,start

" busqueda incremental
set hlsearch

" To move the cursor to the matched string, while typing the search pattern
set incsearch

" Jump to matching bracket for 2/10th of a second (works with showmatch)            
set matchtime=2

" Scroll when cursor gets within 3 characters of top/bottom edge                    
set scrolloff=3

" Use 4 spaces for (auto)indent                                                     
set shiftwidth=4

set ts=2

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" When a bracket is inserted, briefly jump to a matching one                        
set showmatch

" Use 4 spaces for <Tab> and :retab                                              
set tabstop=4

" Write swap file to disk after every 50 characters                              
set updatecount=50


" Use menu to show command-line completion (in 'full' case)                      
set wildmenu

" Set command-line completion mode:                                              
"   - on first <Tab>, when more than one match, list all matches and complete    
"     the longest common  string                                                 
"   - on second <Tab>, complete the next full match and show menu                
set wildmode=list:longest,full

" Remember things between sessions                                               
"                                                                                
" '20  - remember marks for 20 previous files                                    
" \"50 - save 50 lines for each register                                         
" :20  - remember 20 items in command-line history                               
" %    - remember the buffer list (if vim started without a file arg)            
" n    - set name of viminfo file                                                
set viminfo='20,\"50,:20,%,n~/.viminfo

" Fix my <Backspace> key (in Mac OS X Terminal)                                  
"set t_kb=^?                                                                      
"fixdel

" Go back to the position the cursor was on the last time this file was edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <=  line("$")|execute("normal `\"")|endif

" netRW: Open files in a split window                                            
let g:netrw_browse_split = 1

iab \f\ <c-r>=strftime("$%Y-%m-%d %H:%M:%S$")<cr>
iab \*\ /** <cr> * <cr> * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - */

" no mas beep
set vb t_vb=

runtime macros/matchit.vim

set ruler
set history=1000
set nu
set relativenumber
set undofile
let g:miniBufExplSplitBelow=1
" map b :MiniBufExplorer<cr>
:map <F8> <Esc>:%s/\$\(.*\)\$/\=strftime("$%Y-%m-%d %H:%M:%S$")/<cr>

fun! Log()
	let @a= "log_" . strftime("%d%b%Y_%H%M%S") . ".txt"
	exec 'save ~/Dropbox/_log/' . fnameescape(@a)
	exe ":au FocusLost" expand("%") ":wa"	
    exe ":colo solarized"
endfun


set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=+1

"if has("gui_running")
" set fuoptions=maxvert,maxhorz
" au GUIEnter * set fullscreen
"  set guifont=Menlo\ for\ Powerline:h12 
"endif

" toggle NERDTree
map <F2> :NERDTreeToggle<CR>

" Activa/Desactiva autoclose.vim
nmap <Leader>x <Plug>ToggleAutoCloseMappings

" Status Line {  
"   set laststatus=2                             " always show statusbar  
"   set statusline=  
"   set statusline+=%-10.3n\                     " buffer number  
"   set statusline+=%f\                          " filename   
"   set statusline+=%h%m%r%w                     " status flags  
"   set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
"   set statusline+=%=                           " right align remainder  
"   set statusline+=0x%-8B                       " character value  
"   set statusline+=%-14(%l,%c%V%)               " line, character  
"   set statusline+=%<%P                         " file position  
"}  

let g:ragtag_global_maps = 1

" PHP syntax settings
let php_sql_query=1
let php_htmlInStrings=1
let php_folding=0
let php_parent_error_close=1
let php_parent_error_open=1

" .inc, phpt, phtml, phps files as PHP
autocmd BufNewFile,BufRead *.inc set ft=php
autocmd BufNewFile,BufRead *.phpt set ft=php
autocmd BufNewFile,BufRead *.phtml set ft=php
autocmd BufNewFile,BufRead *.phps set ft=php

" PHP parser check (CTRL-L)
" ":autocmd FileType php noremap <C-L> :w !php -l<CR>

" simplenote.vim
let g:SimplenoteUsername = "jp.aqueveque@gmail.com"
let g:SimplenotePassword = "silogism024"

" asocia la tecla F2 a guardar un temporal
vnoremap <F2> :w! /tmp/_pibote<CR>     
" lee el temporal 
nnoremap <F3> :r /tmp/_pibote<CR>         

" Directional Keys {{{

" It's 2012.
noremap j gj
noremap k gk
noremap gj j
noremap gk k

" Easy buffer navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" }}}

" formatea XML
vmap ,x :!tidy -xml -q -i -w 0 -utf8<CR>

" vim-powerline
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'compatible'

" gz in command mode closes the current buffer
map gz :bdelete<cr>
"
" g[bB] in command mode switch to the next/prev. buffer
map gb :bnext<cr>
map gB :bprev<cr>

" activa background para el cursorline
set cursorline


" muestra el numero del buffer
nnoremap ,l :echo bufnr('%')<CR>

" formate un listodo en comillas + coma
vmap ,hc !python ~/python/dev-helpers/comillas+coma.py<CR>
" formatea un listado de variables un row data table
vmap ,hr !python ~/python/dev-helpers/echoRowData.py<CR>
" formatea un string de:este:forma a una html table
vmap ,ht !awk -f ~/awk/array2html.awk<CR>

" Depura una variable
vnoremap <buffer> zd "zdiZend_Debug::dump(<C-R>z)<ESC>

" borra un atributo="valor"
nnoremap ,ha d2f"X

" guardar automaticamente los folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview 

" pathogen.vim
execute pathogen#infect()

" instalando http://kien.github.com/ctrlp.vim/#installation
set runtimepath^=~/.vim/bundle/ctrlp.vim

" para no mezclar la navegacion de la ventana con sparkup
let g:sparkupExecuteMapping = '<leader>e'
let g:sparkupNextMapping = '<leader>n'

" carga mi archivo de abreviaciones
cabbr myabb source ~/.vim/abbreviations.vim

" ya no quiero show marks
let showmarks_enable=0

" Ack de moledera
let $LC_ALL="es_ES.UTF-8"

" vigotes (para liquid como para mustache o angular )
" vnoremap <buffer> bb "zdi{{ <C-R>z }}<ESC>"

" Reselect visual block after indent/outdent - lovely
vnoremap < <gv
vnoremap > >gv

" limpia espacios en blanco en un bloque
cabbr leb s/\%V \s*//g


" mostrar constantemente el nombre del archivo
set ls=2

" G hasta el final de la columna, no desde el 0
set nosol

" Al hoyo
vmap T "_d

" copia en un temporal
vmap t "ty

" autodir - siempre trabajando en la home de buffer
" set autochdir 

" el remedio para el salto de linea
" https://github.com/Townk/vim-autoclose/issues/48
" imap {{ {{}}<Esc>hi

set bg=dark

" descarga la URL seleccionada 
function! DownloadUrl()
   " guarda la seleccion en el registro x
   normal gv"uy
   " obtiene el nombre del archivo de la URL
   let file  = substitute(@u,'.*\/','','g')  
   " executa curl el parametro del nombre del archivo y lo deja bajo /tmp
   execute "!curl -o /tmp/" . file . " ".@u
endfunction

