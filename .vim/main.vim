set nocompatible
" language mes en

call pathogen#infect()
call pathogen#infect('bundle/{}')
filetype off
syntax on
filetype plugin indent on

source $VIMRUNTIME/mswin.vim
behave mswin

" NO BEEPING, PLEASE
autocmd VimEnter * set vb t_vb=
set novb
set noerrorbells
set visualbell
set t_vb=

let g:syntastic_enable_signs=1
let b:shell = 'zsh'

source ~/.vim/mappings.vim
source ~/.vim/tags.vim

nnoremap <C-e> :Eval<CR>
nnoremap E :%Eval<CR>

" ========== Perform language-specific tasks
" Minimizes switches between languages
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

if has("win32")
    set gfn=Consolas:h11:cANSI
else
    set guifont=Monaco:h14
endif

set nofoldenable
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,cp1251,cp866,koi8-r
" Do NOT unload buffer when switch to another one
" this allows to edit several files in the same time without having to save
" them each time you switch between them
set hidden

" ========== Overall interface settings
set background=dark
colorscheme solarized
if &t_Co>2 || has("gui_running")
    syntax on
endif

set laststatus=2
set langmenu=none
set et!
" set nu!
set ai
set nobackup
set writebackup
" Show the cursor position all the time
set ruler
" Turn on number vertical line
set number
" Turn off any bells
set novisualbell
set t_vb=   
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

set hlsearch
set incsearch
set ignorecase
set smartcase

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red

" Allow to use backspace instead of "x"
set backspace=indent,eol,start whichwrap+=<,>,[,]

"highlight TooLongLine term=reverse ctermfg=Yellow ctermbg=Grey
"match TooLongLine /.\%>100v/

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

set wildignore=*.swp,*.bak,*.pyc,*.class

set nobackup
set noswapfile

" ========== Language-specific settings
" Code convention says no!
set syn=auto 
set showmatch 
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

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
match BadWhitespace / $/
au FileType python,cs set softtabstop=4 shiftwidth=4 expandtab
au FileType python set softtabstop=4 shiftwidth=4 expandtab tw=100

" rainbow parentheses
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces

" Powerline
let g:Powerline_colorscheme="solarized256"
" let g:Powerline_symbols = 'fancy'

" Paredit
let g:paredit_electric_return=0

" Smart scrolling
set so=14

" iTerm + Solarized hack
hi Search cterm=NONE ctermfg=grey ctermbg=blue

" syntastic
let g:syntastic_python_checkers = ['flake8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" CtrlP Tags
let g:ctrlp_tjump_only_silent = 1
