"""""""""""""""""""""""""""""""
" General                     "
"""""""""""""""""""""""""""""""

"Don't use VI compatible mode
set nocompatible

"Enable filetype plugin
filetype plugin on
filetype indent on

"Sets how many lines of history VIM has to remember
set history=300

"Enable hidden buffers
set hidden

"Set to auto read when a file is changed from the outside
set autoread

"Enable magic search patterns
set magic

"No error bells
set noerrorbells
set novisualbell

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""
" Indent & Tabs               "
"""""""""""""""""""""""""""""""

"Auto indent
set autoindent
"Smart indet
set smartindent

"Wrap lines
set wrap

"Tab character displayed as 4 spaces
set tabstop=4
"Expand tab insertion to spaces
set expandtab
"Insert 2 spaces when pressing tab
set softtabstop=2
"Indent by 2 spaces
set shiftwidth=2
"Insert smart tabs at beginning of line
set smarttab

"""""""""""""""""""""""""""""""
" Output                      "
"""""""""""""""""""""""""""""""

"Enable syntax highlighting
syntax enable

"Set colors
set background=light
colorscheme solarized
set t_Co=16

"Font for gvim
set guifont=monospace\ 11

"Display line numbers
set number

"Scroll offset when moving vertically
set scrolloff=7

"Show file position
set ruler

"Always display statusline
set laststatus=2

"Format of statusline
set statusline=%F\ [%{strlen(&fenc)?&fenc:'none'}][%{&ff}]%h%w%y%m%r%=%l:%c\ %l/%L\ %P

"""""""""""""""""""""""""""""""
" Input                       "
"""""""""""""""""""""""""""""""

"Set mouse to r to enable middle button paste
set mouse=r

"Leader and local leader
let mapleader = 'j'
let g:mapleader = 'j'
let maplocalleader = 'h'
let g:maplocalleader = 'h'

"Shortcuts
"Write
nmap <leader>w :w<cr>
"Quit
nmap <leader>q :qa<cr>
"Edit
nmap <leader>e :e 
"Intelligent close
map <leader>c :Bclose<cr>

"Go to next buffer before closing current
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete ".l:currentBufNum)
   endif
endfunction

"Map space to / and c-space to ?
map <space> /
map <C-space> ?

"Smart way to move btw. windows
map <C-down> <C-W><down>
map <C-up> <C-W><up>
map <C-left> <C-W><left>
map <C-right> <C-W><right>

"Move around buffers
map <M-left> :MBEbp<cr>
map <M-right> :MBEbn<cr>

"""""""""""""""""""""""""""""""
" Plugin configuration        "
"""""""""""""""""""""""""""""""

"Minibuffer
let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplVSplit = 25
"let g:miniBufExplSplitBelow=1

"LaTeX Suite
"let g:Tex_CompileRule_pdf = 'xelatex'
"let g:Tex_CompileRule_pdf = 'pdflatex'
let g:Tex_CompileRule_pdf = 'lualatex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections="part,chapter,section,%%fakesection,subsection,subsubsection,paragraph"
let g:Tex_FoldedMisc=""
let g:Tex_FoldedEnvironments=""
let g:Imap_UsePlaceHolders = 0
let g:Tex_SmartKeyQuote=0
autocmd FileType tex map <silent><leader><space> :w!<cr>:call Tex_CompileLatex()<cr>
autocmd BufNewFile,Bufread *.tex set filetype=tex

"Yank Ring
map <leader>r :YRShow<cr>
let g:yankring_persist = 0
let g:yankring_history_dir = "~/.vim"

"""""""""""""""""""""""""""""""
" Misc                        "
"""""""""""""""""""""""""""""""

"Map Y to yank till end of line to be conform with other commands
map Y y$

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

