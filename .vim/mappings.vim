"Various useful key mappings

" More suitable mapping
function SMap(key, action, ...)
    let modes = " vi"
    if (a:0 > 0)
        let modes = a:{1}
    endif
    if (match(modes, '\Ii') != -1)
        execute 'imap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Nn') != -1)
        execute 'nmap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, ' ') != -1)
        execute 'map ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Vv') != -1)
        execute 'vmap ' . a:key . ' <Esc>' . a:action
    endif
endfunction

" F12 to generate ctags for omnicppcomplete
call SMap("<F12>", ":!ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q --exclude=venv .<CR>")
call SMap("<F9>", ":!ctags -R -f .tags  --languages=Clojure .<CR>")

call SMap("<F2>", ":NERDTreeToggle<cr>")

call SMap("<F3>", ":Gblame<cr>")

call SMap("<F4>", ":Gdiff<cr>")

call SMap("<F5>", ":make<cr>")

map <C-E> :NERDTreeToggle<cr>


" Switch off fucked 'Replace mode'
imap <Ins> <Esc>l

" Open tag under cursor in new tab
map <C-W>] <C-W>]:tab split<CR>gT:q<CR>gt
map <C-W>t <C-W>t:tabnew<CR>
map <C-W>p :tabprevious<CR>
map <C-W>n :tabnext<CR>

" Open tags in new window
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

" force transition to vim-style movements
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" If you like long lines with line wrapping enabled, this solves the problem that pressing down
" jumpes your cursor “over” the current line to the next line. It changes behaviour so that it jumps
" to the next row in the editor (much more natural)
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" ========== Leader mappings
let mapleader=","

" Split window vertically and switch to the left
" nnoremap <leader>w <C-w>v<C-w>l
nnoremap <leader><space> :noh<cr>

" Fast main.vim opening
nmap <silent> <leader>ev :e ~/.vim/main.vim<CR>
nmap <silent> <leader>sv :so ~/.vim/main.vim<CR>


" ========== Other mappings
nnoremap <tab> %
vnoremap <tab> %

" No need to use shift when entering commands
nnoremap ; :

nmap <C-Z> :stop<CR>

" Tagbar
nmap <F8> :TagbarToggle<CR>

"
imap jj <Esc>

" Switch between tabs with Cmd-Shift-Left/Right
map <D-S-Left> gT
map <D-S-Right> gt
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<CR>

" CtrlP tags
nnoremap <C-]> :CtrlPtjump<cr>
vnoremap <C-]> :CtrlPtjumpVisual<cr>

" "Vim after 11 years"
nmap \l :setlocal number!<CR>
nmap \o :set paste!<CR>
nmap \q :nohlsearch<CR>

" Tmux
" Repeat last command in next pane shell
nmap \r :!tmux send-keys -t 0:2 C-p C-j <CR><CR>
