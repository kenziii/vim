"""""""""""""""""
" Global
"""""""""""""""""
set nocompatible

"Font
"Scheme

" set gfn=Courier\ New
if has("gui_gtk2")
    set gfn=Anonymous\ Pro\ 11
elseif has("gui_macvim")
    set gfn=Anonymous\ Pro:h12
elseif has("gui_win32")
    set gfn=Anonymous\ Pro:h12
end
" set gfn=Anonymous\ Pro:h12
if has("gui_running")
	" colorscheme molokai 
	colorscheme wombat 
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

cd $HOME/Sites

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
set softtabstop=4


" reference: http://py.vaults.ca/~x/python_and_vim.html

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

autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

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
nnoremap <leader>g :GundoToggle<CR>

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
    " BufExplorer
    """""""""""""""""""""""""
    let g:bufExplorerDefaultHelp=0       " Do not show default help.
    let g:bufExplorerShowRelativePath=1  " Show relative paths.
    let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
    let g:bufExplorerSplitRight=1        " Split right.    


    """""""""""""""""""""""""
    " pathogen
    """""""""""""""""""""""""
    call pathogen#runtime_append_all_bundles()

    """""""""""""""""""""""""
    " pyflakes 
    """""""""""""""""""""""""
    if has("gui_running")
        highlight SpellBad term=underline gui=undercurl guisp=Orange
    endif

    """""""""""""""""""""""""
    " snipmate_for_django
    " https://github.com/robhudson/snipmate_for_django
    """""""""""""""""""""""""
    "autocmd FileType python set ft=python.django
    autocmd FileType html set ft=htmldjango.html
