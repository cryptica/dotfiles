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

"Use error bells
set errorbells
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

"Have mouse always enabled
set mouse=a

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
"Tab edit
nmap <leader>e :tabedit 
"Intelligent close
map <leader>c :tabclose<cr>

"Smart way to move btw. windows
map <C-down> <C-W><down>
map <C-up> <C-W><up>
map <C-left> <C-W><left>
map <C-right> <C-W><right>

"Move around tabs
map <M-left> :tabprevious<cr>
map <M-right> :tabnext<cr>

"""""""""""""""""""""""""""""""
" Plugin configuration        "
"""""""""""""""""""""""""""""""

"LaTeX Suite
let g:Tex_CompileRule_pdf = 'lualatex --shell-escape'
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
let g:yankring_history_dir = "~/"

"""""""""""""""""""""""""""""""
" Misc                        "
"""""""""""""""""""""""""""""""

"Map Y to yank till end of line to be conform with other commands
map Y y$

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

