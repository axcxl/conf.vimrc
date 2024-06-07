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
Bundle 'iamcco/markdown-preview.nvim'
" Use :Make for background jobs. :AbortDispatch kills the process started!
Bundle 'tpope/vim-dispatch'
Bundle 'idanarye/vim-merginal'
Bundle 'jeffkreeftmeijer/vim-numbertoggle' 
Bundle 'hari-rangarajan/CCTree'         
" Smooth scrolling - definitely needed :D
Bundle 'yuttie/comfortable-motion.vim'
Bundle 'scrooloose/nerdtree' 
Bundle 'jlanzarotta/bufexplorer'        
" Optional
Bundle 'milkypostman/vim-togglelist'
Bundle 'lyuts/vim-rtags'
Bundle 'junegunn/fzf'
Bundle 'junegunn/fzf.vim'
Bundle 'wookayin/fzf-ripgrep.vim'
Bundle 'ervandew/supertab'
Bundle 'm42e/trace32-practice.vim'
Bundle 'junkblocker/patchreview-vim'
Bundle 'chrisbra/Colorizer'
Bundle 'powerman/vim-plugin-AnsiEsc'
" Note: need to run lua command below for this to work!
Bundle 'dhananjaylatkar/cscope_maps.nvim'


" REMOVED
"Bundle 'ajh17/VimCompletesMe' - REPO DELETED
"NEEDED - for python? - Bundle 'davidhalter/jedi-vim'
"Bundle 'ctrlpvim/ctrlp.vim'
"Bundle 'will133/vim-dirdiff'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'vim-scripts/cscope_macros.vim'  - replaced with cscope_maps
"Bundle 'a.vim' - not used
"Bundle 'jesseleite/vim-agriculture' - AgRaw/RgRaw, not used much
"NOTE: call HardMode() to enable, EasyMode() to disable
"Bundle 'wikitopian/hardmode' - not used

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

" Copy filename/full path/relative path to clipboard + substit backslashes
nmap ,cn :let @*=substitute(expand("%:t"), "/", "\\", "g")<CR>
nmap ,cf :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
nmap ,cp :let @*=substitute(expand("%"), "/", "\\", "g")<CR>


else

" Set unified temp and backup directory - NOT PORTABLE
set backupdir=~/workspace/000_BACKUP//	" backup (~) stuff
set directory=~/workspace/000_BACKUP//	" swap files

" Copy filename/full path/relative path to clipboard
nmap ,cn :let @+=expand("%:t")<CR>
nmap ,cf :let @+=expand("%:p")<CR>
nmap ,cp :let @+=expand("%")<CR>

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

" Add support for running in tmux
" NOTE: using sgr since it works for a lot of colums.
" Otherwise tagbar does not register any clicks
"set ttymouse=sgr

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
" Set color scheme for vim - chose this for now since I can see the visual line in vim
colorscheme industry
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
"set cscopequickfix=s-,c-,d-,i-,t-,e-,g-

" New cscsope maps plugin
lua require('cscope_maps').setup()

" Copy-paste from system clipboard
map <C-c> "+y

"----------------
"---KEY MAPPINGS 
"----------------
"F2 = save current file (ALL MODES) 
map <F2> :w<CR>
map! <F2> <ESC>:w<CR>

"F3 = DIFF FILE (NEW, WIP)
"F4 - close all diffs
map <F3> :diffthis<CR>
map <F4> :bufdo diffoff!<CR>

"F4 OPEN! 
"OLD USAGE: autocmd FileType c map <buffer> <F4> <C-\>g

"F5 OPEN! 
" OLD USAGE: autocmd FileType c map <buffer> <F5> <C-\>s

"F6 OPEN! 
" OLD USAGE: map <F6> <C-\>f
map <F6> :Copen<CR>

"F7 - switch to .h (ALL MODES)
"map <F7> :A<CR>
"map! <F7> <ESC>:A<CR>

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

" Remap arrow keys to move between buffers
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" bind Q to close current window (never used ex mode :) )
nnoremap Q :wincmd c<CR>

" Fast QUIT
nnoremap <leader>q :qall<CR>

" Fast SAVE (for diff)
nnoremap <leader>w :wall!<CR>

"Shift-PGUP/PGDOWN - move through quick list witout openning the list
nnoremap <silent> <S-Up> :cp<CR>
nnoremap <silent> <S-Down> :cn<CR>
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

" Set theme
let g:airline_theme='papercolor'

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

"+++ Rtags - change default command (on buster it is like this)
let g:rtagsRcCmd = "rtags-rc"

"+++ The Silver Searcher
" bind \ (backward slash) to grep shortcut
nnoremap \ :Rg<SPACE>

" bind L to grep *word* under cursor 
nnoremap L :Rg <C-R><C-W><CR>

"+++ Merginal
" Horizontal split of window - useful for long branch names
let g:merginal_splitType=''
" Map to Ctrl-b - Branches
nnoremap <space>gm :Merginal<CR>

"+++FZF
nmap <C-P> :Files<CR>

command! -bang -nargs=* RgPy
  \ call fzf#vim#grep(
  \   'rg --type py --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

"+++ Comfortable-motion 
" Use on mouse scrolling
"noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
"noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
" Set some parameters
"let g:comfortable_motion_friction = 160.0
"let g:comfortable_motion_air_drag = 8.0

"+++ Fugitive
nnoremap <space>gs :Git<CR>
nnoremap <space>gd :Gvdiff<CR>
nnoremap <space>gl :Git log<CR>
nnoremap <space>gf :Git log -- %<CR>
" This is basically a checkout (need to do a save)
nnoremap <space>gr :Gread<CR>
" Search git commit messages
nnoremap <space>gg :Glog --grep=
nnoremap <space>gb :Git blame<CR>
" How to use: open history, go to line and issue command. NOTE: make sure only one window is opened!
nnoremap <space>gh ^yw :cclose<CR>:Gvdiff <C-R>0<CR>

" Close hidden buffers opened by fugitive
au BufHidden fugitive://* bd %

"-----------------------------------
"---FUNCTIONS (run with exec <name>)
"-----------------------------------
" Deletes all hidden buffers (including open files)
" Needed when Fugitive opens a lot and slows everything down!
" (example: :Glog with not -n option)
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

"-----------------------------------
"--- AUTO STUFF
"-----------------------------------
" Make quickfix windows appear under all open windows!
augroup DragQuickfixWindowDown
    autocmd!
    autocmd FileType qf wincmd J
augroup end

