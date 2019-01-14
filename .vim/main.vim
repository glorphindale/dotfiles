set nocompatible
" language mes en

call pathogen#infect()
call pathogen#infect('bundle/{}')

" ======================== UI Config
set nocursorline
" highlight lCursor guifg=NONE guibg=Cyan

if has("win32")
    set gfn=Consolas:h11:cANSI
else
    set guifont="FuraMono-Regular for Powerline":h14
endif

" colorscheme and related stuff
let g:airline#extensions#keymap#enabled = '0'
set termguicolors
let g:base16_airline=1
let base16colorspace=256
let g:base16_transparent_background = 1
set background=dark
" Nice pair
" colorscheme default
" let g:airline_theme='wombat'
colorscheme lucius
let g:airline_theme='lucius'

""""""""""""" Old and tried, transparent in gnome terminal
" set background=dark
" colorscheme delek
" let g:airline_theme='seagull'
""""""""" Nice and dark
" set background=dark
" colorscheme tender
" let g:airline_theme='term'  ;; airline not so nice, as 'tender' does not work
""""""""" light
" set background=light
" colorscheme lucius
" LuciusLight
" let g:airline_theme='silver'
""""""""" or dark
" set background=dark
" colorscheme lucius
" let g:airline_theme='wombat'
""""""""" colorful, good light and dark
" set background=light
" colorscheme gruvbox
" let g:airline_theme='gruvbox'

" Visual
highlight TooLongLine term=reverse ctermfg=Yellow ctermbg=Black
match TooLongLine /.\%>100v/

set number  " line numbers
set relativenumber  " relative line numbers

set wildmenu  " Nice window with autocompletion suggestions
set lazyredraw  " redraw only when need to
set showmatch  " Highlight matching parens

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r

" Smart scrolling
set so=8

" iTerm + Solarized hack , Make search highlight more visible
" hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi Search cterm=NONE ctermfg=grey ctermbg=red


" ====================================
" Magic?
filetype off
syntax on
filetype plugin indent on

source $VIMRUNTIME/mswin.vim
behave mswin

" NO BEEPING, PLEASE
autocmd VimEnter * set vb t_vb=
set novb
set noerrorbells
set novisualbell

let g:syntastic_enable_signs=1
let b:shell = 'zsh'

source ~/.vim/mappings.vim
source ~/.vim/local_mappings.vim
source ~/.vim/tags.vim

nnoremap <C-e> :Eval<CR>
nnoremap E :%Eval<CR>

set path=.

" ========== Perform language-specific tasks
" Minimizes switches between languages
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" ========== Folding
set foldenable
set foldlevelstart=10  " open most folds by default
set foldnestmax=10
" open/close folds with spacebar
nnoremap <space> za
set foldmethod=syntax
" Syntax does not work with Python strangely, workaround that
au BufRead,BufNewFile *.py,*.pyw set foldmethod=indent


" Do NOT unload buffer when switch to another one
" this allows to edit several files in the same time without having to save
" them each time you switch between them
set hidden

" ========== Overall interface settings
set laststatus=2
set langmenu=none
set et!
" set nu!
set ai
set nobackup
set writebackup
" No menu, toolbar and big tab buttons
set guioptions-=e
set guioptions-=T
set guioptions-=m
" Disable scrollbars
set guioptions+=LlRrb
set guioptions-=LlRrb
" Turn off redrawing when executing macroses
set lz
" Cool whitespaces characters showing
"set list!
"set listchars=tab:>-

" ================== Search
set hlsearch
set incsearch
set ignorecase
set smartcase

" Allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class

set nobackup
set noswapfile

" ========== Language-specific settings
" Code convention says no!
set syn=auto
filetype on
filetype plugin on
filetype indent on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set wrap

" Various language-specific syntax settings
au FileType sql set textwidth=0 softtabstop=2 shiftwidth=2 tabstop=2 expandtab
au BufRead,BufNewFile *.sql set textwidth=0
au FileType txt set textwidth=0 softtabstop=4 shiftwidth=4 noexpandtab tabstop=4
au FileType cpp,c,hpp,h set shiftwidth=4 softtabstop=4 tabstop=4 expandtab
au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.hpp,*.h set textwidth=100
au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.hpp,*.h match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.pro set noexpandtab
au FileType conf set softtabstop=4 shiftwidth=4
au FileType xslt,xml,xsd set softtabstop=2 shiftwidth=2 expandtab tw=100
au BufRead,BufNewFile *.html set tw=0

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
match BadWhitespace / $/
au FileType python,cs set softtabstop=4 shiftwidth=4 expandtab
au FileType python set softtabstop=4 shiftwidth=4 expandtab tw=100

" ================== Plugins
" rainbow parentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Paredit
let g:paredit_electric_return=0

" syntax checking with linters via ale
let g:ale_linters = {'python': ['flake8'], 'clojure': []}
let g:ale_lint_on_text_changed = 'never'
let g:ale_python_flake8_executable = "flake8_2.7"
let g:ale_c_gcc_options='-std=c11 -Wall -D_POSIX_C_SOURCE=200112L'

" CtrlP Tags
let g:ctrlp_tjump_only_silent = 1
let g:ctrlp_switch_buffer = 0  " always open in new buffer
set wildignore+=*/env*/*,*/out/*,*/target/*,*/venv*/*

" NERDTree
let NERDTreeIgnore=['\~$', '\.pyc']

" Hardtime
let g:hardtime_default_on = 0
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
let g:hardtime_ignore_quickfix = 1

" Neovim
set ttimeoutlen=10  " Remove slugishness when using Ctrl+[ to leave insert mode
set inccommand=nosplit  " Inline change preview with s/// command



" Comments should be shouting, should be here to not be override by other files
highlight Comment ctermfg=7 guifg=#80a0ff

" Gitgutter
set updatetime=1000
