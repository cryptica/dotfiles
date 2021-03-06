"""""""""""""""""""""""""""""""
" General                     "
"""""""""""""""""""""""""""""""

"Load pathogen
call pathogen#infect()
call pathogen#helptags()

"Don't use VI compatible mode
set nocompatible

"Enable filetype plugin
filetype plugin on
filetype indent on

"Sets how many lines of history VIM has to remember
set history=300

"Show command
set showcmd

"Show matching braces
set showmatch

"Enable wildmenu
set wildmenu
set wildignore=*.dll,*.o,*.pyc,*.pyo,*.bak,*.swp,*.exe,*.jpg,*.jpeg,*.png,*.gif

"Enable hidden buffers
set hidden

"Set to auto read when a file is changed from the outside
set autoread

"Enable magic search patterns
set magic

"Use error bells
set errorbells
set novisualbell

"Don't create swap files
set noswapfile

"When .vimrc is edited, reload it
autocmd! bufwritepost .vimrc source ~/.vimrc

" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" needs +clipboard / +xterm_clipboard
" (in Arch you need the gvim package even with console vim)
set clipboard=autoselect

"""""""""""""""""""""""""""""""
" Indent & Tabs               "
"""""""""""""""""""""""""""""""

"Auto indent
set autoindent
"Smart indent
set smartindent
"No cindent
set nocindent

"Wrap lines
set wrap
set linebreak

"Tab character displayed as 4 spaces
set tabstop=4
"Expand tab insertion to spaces
set expandtab
"Insert 4 spaces when pressing tab
set softtabstop=4
"Indent by 4 spaces
set shiftwidth=4
"Insert smart tabs at beginning of line
set smarttab
"Increase tab maximum
set tabpagemax=100

" characters to use for :set list
set listchars=tab:▸\ ,eol:¬

" don't exit visual mode after indenting/outdenting; inspired by
" http://vimcasts.org/episodes/indentation-commands/
vmap < <gv
vmap > >gv

"""""""""""""""""""""""""""""""
" Output                      "
"""""""""""""""""""""""""""""""

"Enable syntax highlighting
syntax enable

"let g:colors_name='solarized'
"Set colors
set background=light
set t_Co=256
colorscheme solarized

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

"Enable rainbow parentheses
autocmd VimEnter * RainbowParenthesesToggleAll
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" highlight unwanted spaces
autocmd BufNewFile,Bufread * highlight UnwantedSpaces ctermbg=red guibg=red
autocmd BufNewFile,Bufread * match UnwantedSpaces /\s\+$\|\s\t\|\t\s/

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

"Delete backwards with backspace in normal mode
:nnoremap <bs> X

"Shortcuts
"Write
nmap <leader>w :w<cr>
"Quit
nmap <leader>q :qa<cr>
"Buffer edit
nmap <leader>e :e 
"Buffer close
map <leader>c :MBEbd<cr>

"Smart way to move btw. windows
map <C-down> <C-W><down>
map <C-up> <C-W><up>
map <C-left> <C-W><left>
map <C-right> <C-W><right>
map <C-s> <C-W><
map <C-o> <C-W>>
map <C-c> <C-W>c
map <leader>v <C-W>v
map <leader>s <C-W>s

"Move around buffers
map <M-left> :MBEbp<cr>
map <M-right> :MBEbn<cr>
nmap <C-p> :MBEbp<cr>
nmap <C-e> :MBEbp<cr>
nmap <C-n> :MBEbn<cr>
"map <leader>r :MBEbp<cr>
"map <leader>n :MBEbn<cr>
"map <leader>m :MBEFocusAll<cr>
map <leader>1 :b 1<cr>
map <leader>2 :b 2<cr>
map <leader>3 :b 3<cr>
map <leader>4 :b 4<cr>
map <leader>5 :b 5<cr>
map <leader>6 :b 6<cr>
map <leader>7 :b 7<cr>
map <leader>8 :b 8<cr>
map <leader>9 :b 9<cr>

"Move around errors
map <leader>p :lprevious<cr>
map <leader>n :lnext<cr>
map <leader>l :ll<cr>

"Omnicompletion
inoremap <C-O> <C-X><C-O>

"Make
map <silent><leader><space> :w<cr>:make<cr>

"""""""""""""""""""""""""""""""
" Plugin configuration        "
"""""""""""""""""""""""""""""""

"LaTeX Suite
let g:Tex_CompileRule_pdf='latexmk -pdflatex=lualatex -latexoption=-halt-on-error -pdf $*'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_FoldedSections="part,chapter,section,%%fakesection,subsection,subsubsection,paragraph"
let g:Tex_FoldedMisc=""
let g:Tex_FoldedEnvironments=""
"let g:Imap_UsePlaceHolders = 0
let g:Tex_SmartKeyQuote=0
autocmd BufNewFile,Bufread *.tex set filetype=tex

"Yank Ring
map <leader>r :YRShow<cr>
let g:yankring_replace_n_pkey = '<'
let g:yankring_replace_n_nkey = '>'
let g:yankring_persist = 0
let g:yankring_history_dir = "~/"

"Syntastic
"map <silent><leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1
let g:syntastic_ignore_files=['\m\c.cc$','\m\c.hh']

"Vim2hs
let g:haskell_conceal_wide=1

"MiniBufExplorer
let g:miniBufExplCycleArround=1
let g:miniBufExplAutoStart=1
let g:miniBufExplBuffersNeeded=1

"""""""""""""""""""""""""""""""
" Misc                        "
"""""""""""""""""""""""""""""""

"Map Y to yank till end of line to be conform with other commands
map Y y$

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

"Treat .cl files to OpenCL kernel files
au BufRead,BufNewFile *.cl set filetype=c

