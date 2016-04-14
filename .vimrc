set nocompatible               " be iMproved
filetype off                   " required!

if has("win32") || has("win16")
set rtp+=c:/Work/vim_conf/vundle
else
set rtp+=~/.vim/bundle/vundle/
endif
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'jwhitley/vim-matchit'
Bundle 'bufkill.vim'
Bundle 'a.vim'
Bundle 'mbbill/undotree'
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
Bundle 'vim-scripts/bufexplorer.zip'
Bundle 'vim-scripts/cscope_macros.vim'
Bundle 'ervandew/supertab'
Bundle 'Lokaltog/vim-powerline'

" Python-only stuff
"Bundle 'klen/python-mode'

" IN TESTING
if has("win32") || has("win16")

"No YCM on windows yet...too complicated to build :(
"DEPRECATED, trying the new version on both
"Bundle 'Shougo/neocomplcache'

else

" YCM - still in testing, does not work very good with vxworks
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'rdnetto/YCM-Generator'
endif

Bundle 'Shougo/neocomplete.vim'
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'wikitopian/hardmode'
Bundle 'milkypostman/vim-togglelist'
Bundle 'ctrlpvim/ctrlp.vim'
" NOTE: call HardMode() to enable, EasyMode() to disable

" Bundle 'kien/ctrlp.vim' - NOT MAINTAINED, see new link
" Bundle 'Valloric/ListToggle' - does not appear to work
" Bundle 'scrooloose/syntastic' - NO GOOD C LINT ON WINDOWS??
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} - DOES NOT SEEM TO WORK ON WIN
" Bundle 'vim-scripts/CCTree' - NOT WORKING ON WIN!
" Bundle 'taglist.vim'  - OLD One
" Bundle 'fholgado/minibufexpl.vim' - OLD one

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

"+++ CTRLP
"let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  " Windows

else

" Set unified temp and backup directory - NOT PORTABLE
set backupdir=~/workspace/000_BACKUP//	" backup (~) stuff
set directory=~/workspace/000_BACKUP//	" swap files

endif
"----------------
"---MY CONFIG
"----------------
"NOTE: FONT SETTING REMOVED FOR BETTER RESULTS
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

" Bash-like filename completion
set wildmenu
set wildmode=longest:list,full
set wildignore=*.o,*.fasl

" Multiple paste after copy
xnoremap p pgvy

"UNDO stuff
set undolevels=10000	" How many undos
set hid					" Hidden buffers, to make sure we don't loose undo history

" Display CSCOPE results in Quickfix window
set cscopequickfix=s-,c-,d-,i-,t-,e-

" Copy-paste from system clipboard
map <C-S-c> "+y

"----------------
"---KEY MAPPINGS 
"----------------
"F2 = save current file (ALL MODES) 
map <F2> :w<CR>
map! <F2> <ESC>:w<CR>

"F3 = DIFF FILE (NEW, WIP)
"Shift-F3 - close all diffs
map <S-F3>c :diffoff!<CR><C-w>c
map <S-F3>s :DiffSVN<CR>

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

"----------------
"---PLUGIN CONFIG
"----------------
"+++ Neocomplete
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Recommended key-mappings.
" <TAB>: completion. NOTE: CTRL+TAB = TAB without completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <BS>: close popup and delete backword char.
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? "\<C-y> " : "\<Space>"
" Close popup by <Enter>.
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'

"+++ Supertab
let g:SuperTabDefaultCompletionType = "context"

"Shift-PGUP/PGDOWN - move through quick list witout openning the list
map <S-PageUp> :cp<CR>
map! <S-PageUp> <ESC>:cp<CR>

map <S-PageDown> :cn<CR>
map! <S-PageDown> <ESC>:cn<CR>


"+++ CTAGS (use with care, might take long on large C projects
"autocmd FileType python map <F3> <ESC>:!ctags -R --python-kinds=+cfmvi --fields=+iaS --exclude=.hg --extra=+q<CR><CR><CR>
"autocmd FileType python map! <F3> <ESC>:!ctags -R --python-kinds=+cfmvi --fields=+iaS --exclude=.hg --extra=+q<CR><CR><CR>


"+++ VIM-SESSION
let g:session_autoload="yes"
let g:session_autosave="yes"
let g:session_autosave_periodic=10
let g:session_default_overwrite="no"


"+++ A
let g:alternateNoDefaultAlternate=1
let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,sfr:../h'


"+++ VIM-POWERLINE
set encoding=utf-8
set laststatus=2
let g:Powerline_symbols = "fancy"

"+++ CTRLP
let g:ctrlp_working_path_mode = 'wra'


"-----------------------
" FUNCTIONS
"-----------------------
"SOURCE: http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"SOURCE: http://vim.wikia.com/wiki/Diff_current_buffer_and_the_original_file
function! s:DiffWithSVNCheckedOut()
  let filetype=&ft
  diffthis
  vnew | exe "%!svn cat -r base " . expand("#:p")
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSVN call s:DiffWithSVNCheckedOut()
