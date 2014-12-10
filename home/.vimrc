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
highlight UnwantedSpaces ctermbg=red guibg=red
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

"Move around erros
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
let g:yankring_persist = 0
let g:yankring_history_dir = "~/"

"Syntastic
map <silent><leader>s :SyntasticToggleMode<CR>
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_open=1

"Vim2hs
let g:haskell_conceal_wide=1

"""""""""""""""""""""""""""""""
" Misc                        "
"""""""""""""""""""""""""""""""

"Map Y to yank till end of line to be conform with other commands
map Y y$

"Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

"Super paste
inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

