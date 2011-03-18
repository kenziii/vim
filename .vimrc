"""""""""""""""""
" Global
"""""""""""""""""
set nocompatible

"Font
"Scheme

" set gfn=Courier\ New
" set gfn=Anonymous\ Pro:h10
if has("gui_running")
	colorscheme desert
	set guioptions-=T	"no toolbar
    set columns=250
    set lines=80
else
	colorscheme ron
endif

"line number
set nu

"show current position
set ruler

"syntax highlighter
syntax on

set nowrap
" Do not wrap for this words
set iskeyword+=_,$,@,%,#,-

"highlight search
set hlsearch
"ignore case when searching
set ignorecase
set incsearch

"show matching bracets
set showmatch

"no error sound
set noerrorbells
set novisualbell

"no backup
set nobackup
set nowritebackup

"set backspace
set backspace=eol,start,indent

" Backspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" show at least three lines and two columns
" while scrolling
set scrolloff=3
set sidescrolloff=2

" without swap file
setlocal noswapfile
set bufhidden=hide

" mouse support in all mode
set mouse=a
" hide mouse when typing
set mousehide

set wildmenu

" set mapleader
let mapleader = ','
let g:mapleader = ','

"""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""

" show status lines
set laststatus=2

" special characters that can be used in search patterns
set magic

"""""""""""""""""""""""""""""
" Text options
"""""""""""""""""""""""""""""
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" remove any extra whitespace from the ends of lines
" autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

set encoding=utf-8
set fileencodings=utf-8

set formatoptions=tcrqn

" auto indent
set ai
" smart indent
set si

"The commandbar is 2 high
set cmdheight=2

filetype plugin on
filetype indent on 

nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
" nmap <c-w> :bd<cr>
if has("mac")
    nmap <cmd-w> :bd<cr>
endif

"""""""""""""""""""""""""""""
" Plugin
"""""""""""""""""""""""""""""

    """""""""""""""""""""""""
    " snipMate
    """""""""""""""""""""""""
    let g:snips_author = 'Jie Ma'

    """""""""""""""""""""""""
    " NERDTree
    """""""""""""""""""""""""
    nmap <silent> <leader>e :NERDTreeToggle<cr>


    """""""""""""""""""""""""
    " pydiction 
    """""""""""""""""""""""""
    let g:pydiction_location = '~/.vim/ftplugin/complete-dict'
    
    """""""""""""""""""""""""
    " BufExplorer
    """""""""""""""""""""""""
    let g:bufExplorerDefaultHelp=0       " Do not show default help.
    let g:bufExplorerShowRelativePath=1  " Show relative paths.
    let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
    let g:bufExplorerSplitRight=1        " Split right.    
