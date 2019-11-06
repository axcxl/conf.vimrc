"FIRST RUN THIS
"git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
"then create the ~/workspace/000_BACKUP folder
"then run vim and run ":PluginInstall"
"and you should be done :)

set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win16")
set rtp+=c:/Work/vim_conf/vundle
else
set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
" NEEDED
Bundle 'majutsushi/tagbar'   
Bundle 'xolox/vim-misc'      
Bundle 'xolox/vim-session'   
Bundle 'vim-airline/vim-airline'        
Bundle 'vim-airline/vim-airline-themes' 
Bundle 'tpope/vim-fugitive'             
Bundle 'idanarye/vim-merginal'
Bundle 'jeffkreeftmeijer/vim-numbertoggle' 
"NOTE: call HardMode() to enable, EasyMode() to disable
Bundle 'wikitopian/hardmode'            
Bundle 'hari-rangarajan/CCTree'         
" Smooth scrolling - definitely needed :D
Bundle 'yuttie/comfortable-motion.vim'
" NEEDED - for python
Bundle 'davidhalter/jedi-vim'
" Optional
Bundle 'ajh17/VimCompletesMe'
Bundle 'scrooloose/nerdtree' 
Bundle 'a.vim'               
Bundle 'jlanzarotta/bufexplorer'        
Bundle 'vim-scripts/cscope_macros.vim'  
Bundle 'milkypostman/vim-togglelist'
Bundle 'lyuts/vim-rtags'
Bundle 'ctrlpvim/ctrlp.vim'
"Might be re-enabled later
Bundle 'ervandew/supertab'
"Bundle 'will133/vim-dirdiff'
"Bundle 'Valloric/YouCompleteMe'

if has("win32") || has("win16")
"WINDOWS only plugins

else
"Linux only plugins

endif

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
" TO RELOAD the config without restart - :so %
"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

if has("win32") || has("win16")
" Set unified temp and backup directory - NOT PORTABLE
set backupdir=c:/Work/000_BACKUP/	" backup (~) stuff
set directory=c:/Work/000_BACKUP//	" swap files

" Copy filename/full path to clipboard + substit backslashes
nmap ,cn :let @*=substitute(expand("%:t"), "/", "\\", "g")<CR>
nmap ,cp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>


else

" Set unified temp and backup directory - NOT PORTABLE
set backupdir=~/workspace/000_BACKUP//	" backup (~) stuff
set directory=~/workspace/000_BACKUP//	" swap files

" Copy filename/fullpath to clipboard
nmap ,cn :let @+=expand("%:t")<CR>
nmap ,cp :let @+=expand("%:p")<CR>

endif

"----------------
"---MY CONFIG
"----------------
"NOTE: FONT SETTING REMOVED FOR BETTER RESULTS
"
""Search down into subfolders
set path+=**

" Enable window title
set title

" Mantain contex near pointer
set scrolloff=3

" Enable mouse support
set mouse=a

" Show partial commmands
set showcmd

" Indentation stuff
set autoindent
set smartindent

" TAB config
set tabstop=4		" tab width = 4 spaces
set shiftwidth=4
set smarttab
set expandtab

" Search stuff
set ic
set incsearch
set hlsearch
set smartcase
set magic

" Wrap lines at 120 chars
set textwidth=120

" Syntax
set t_Co=256
syntax on
filetype on
filetype plugin on
filetype indent on

" Auto read a file when it is changed from the outside
set autoread

" Intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Turn line numbers on
set number
set ruler

" Set relative line - auto set on losing focus
" NOTE: use <C-n> to toggle in program (see numbertoggle)
autocmd FocusLost * set number
autocmd FocusGained * set relativenumber

" Stop blinking cursor
set guicursor+=a:blinkon0

" Highlight matchin baces
set showmatch

" Set backup
set backup

" Delete to the left in insert mode with backspace
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

" Do not look for include files on autocomplete
set complete-=i

" Bash-like filename completion
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.d,*.o,*.txt,*.pod
set wildignore+=*/target/*
set wildignore+=*/.git/*

" Multiple paste after copy
xnoremap p pgvy

"UNDO stuff
set undolevels=10000	" How many undos
set hid					" Hidden buffers, to make sure we don't loose undo history

" Display CSCOPE results in Quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Copy-paste from system clipboard
map <C-S-c> "+y

" Trace32 - syntax Highlight
au BufRead,BufNewFile *.cmm set filetype=trace32
autocmd FileType trace32 setlocal ts=2 sts=2 sw=2 expandtab

"----------------
"---KEY MAPPINGS 
"----------------
"F2 = save current file (ALL MODES) 
map <F2> :w<CR>
map! <F2> <ESC>:w<CR>

"F3 = DIFF FILE (NEW, WIP)
"Shift-F3 - close all diffs
map <F3> :diffthis<CR>
map <S-F3> :diffoff!<CR>

"F4 OPEN! 
"OLD USAGE: autocmd FileType c map <buffer> <F4> <C-\>g

"F5 OPEN! 
" OLD USAGE: autocmd FileType c map <buffer> <F5> <C-\>s

"F6 OPEN! 
" OLD USAGE: map <F6> <C-\>f

"F7 - switch to .h (ALL MODES)
map <F7> :A<CR>
map! <F7> <ESC>:A<CR>

"F8 = open quickfix window
let g:toggle_list_no_mappings="true"
map <F8> :call ToggleQuickfixList()<CR>

"F9 = Find current file in NERD Tree
map <F9> :NERDTreeFind<CR>

"F10 - Open Buffer Explorer
map <F10> :BufExplorer<CR>

"F11 = Toggle NERD TREE
map <F11> :NERDTreeToggle<CR>

"F12 = Toggle TAGBAR
map <F12> :TagbarToggle<CR>

"Remap keys for faster navigation between windows :)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Fast QUIT
nnoremap <leader>q :qall<CR>

" Fast SAVE (for diff)
nnoremap <leader>w :wall!<CR>

"Shift-PGUP/PGDOWN - move through quick list witout openning the list
map <S-PageUp> :cp<CR>
map! <S-PageUp> <ESC>:cp<CR>

map <S-PageDown> :cn<CR>
map! <S-PageDown> <ESC>:cn<CR>
"----------------
"---PLUGIN CONFIG
"----------------
"+++ VIM-SESSION
let g:session_autoload="yes"
let g:session_autosave="yes"
let g:session_autosave_periodic=10
let g:session_default_overwrite="no"
" Persist all options related to :make.
let g:session_persist_globals = ['&makeprg', '&makeef']

"+++ A
let g:alternateNoDefaultAlternate=1
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../h'

"+++ AIRLINE
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_skip_empty_sections = 1
let g:airline#extensions#whitespace#show_message = 0

" remove the encoding part
let g:airline_section_y=''

" unicode symbols
 let g:airline_left_sep = '»'
 let g:airline_left_sep = ''
 let g:airline_right_sep = '«'
 let g:airline_right_sep = '◀'
 let g:airline_symbols.linenr = '␊'
 let g:airline_symbols.linenr = '␤'
 let g:airline_symbols.linenr = '¶'
 let g:airline_symbols.branch = ''
 let g:airline_symbols.paste = 'ρ'
 let g:airline_symbols.paste = 'Þ'
 let g:airline_symbols.paste = '∥'
 let g:airline_symbols.whitespace = 'Ξ'
 " Make more room for the file name
 let g:airline_section_a = ''
 let g:airline#extensions#branch#displayed_head_limit = 6

" Rtags change default command (on buster it is like this)
let g:rtagsRcCmd = "rtags-rc"

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
endif

" bind Ctrl-l = CtrlP in local folder
nnoremap <C-l> :CtrlP .<CR>

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

"+++ Comfortable-motion 
" Use on mouse scrolling
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" Set some parameters
let g:comfortable_motion_friction = 160.0
let g:comfortable_motion_air_drag = 8.0

function! DeleteHiddenBuffers()
    let tpbl=[]
    let closed = 0
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        if getbufvar(buf, '&mod') == 0
            silent execute 'bwipeout' buf
                let closed += 1
        endif
    endfor
    echo "Closed ".closed." hidden buffers"
endfunction

" Merginal - split horizontal
let g:merginal_splitType=''
