"""""""""""""""""
" Global
"""""""""""""""""
set nocompatible

"Font
"Scheme

if has("gui_gtk2")
    set gfn=Anonymous\ Pro\ 11
elseif has("gui_macvim")
    set gfn=Monaco:h12
elseif has("gui_win32")
    set gfn=Anonymous\ Pro:h12
end
" set gfn=Anonymous\ Pro:h12
if has("gui_running")
	" colorscheme molokai 
	colorscheme zenburn 
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
    " pathogen
    """""""""""""""""""""""""
    call pathogen#runtime_append_all_bundles()
    
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
    " snipmate_for_django
    " https://github.com/robhudson/snipmate_for_django
    """""""""""""""""""""""""
    "autocmd FileType python set ft=python.django
    "autocmd FileType html set ft=htmldjango.html
    
    " https://github.com/jceb/vimrc
    " ------------------------------------------------------------
    " FuzzyFinder:
    " expand the current filenames directory or use the current working directory
    function! Expand_file_directory()
        let dir = expand('%:~:.:h')
        if dir == ''
            let dir = getcwd()
        endif
        let dir .= '/'
        return dir
    endfunction

    "nnoremap <leader>fh :FufHelp<CR>
    "nnoremap <leader>fb :FufBuffer<CR>
    nnoremap <leader>fr :FufMruFile<CR>
    nnoremap <leader>fd :FufDir<CR>
    nnoremap <leader>fD :FufDir <C-r>=Expand_file_directory()<CR><CR>
    nmap <leader>Fd <leader>fD
    nmap <leader>FD <leader>fD
    nnoremap <leader>ff :FufFile<CR>
    nnoremap <leader>fF :FufFile <C-r>=Expand_file_directory()<CR><CR>
    nmap <leader>FF <leader>fF
    nnoremap <leader>fR :FufRenewCache<CR>
    let g:fuf_modesDisable = [ 'buffer', 'help', 'bookmark', 'tag', 'taggedfile', 'quickfix', 'mrucmd', 'jumplist', 'changelist', 'line' ]
    let g:fuf_scratch_location  = 'botright'
    let g:fuf_maxMenuWidth = 300
    let g:fuf_file_exclude = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|((^|[/\\])\.[/\\]$)|\.pyo|\.pyc|autom4te\.cache|blib|_build|\.bzr|\.cdv|cover_db|CVS|_darcs|\~\.dep|\~\.dot|\.git|\.hg|\~\.nib|\.pc|\~\.plst|RCS|SCCS|_sgbak|\.svn'
    let g:fuf_previewHeight = 0

    " ------------------------------------------------------------
    " Gundo:
    nmap <leader>u :GundoToggle<CR>
