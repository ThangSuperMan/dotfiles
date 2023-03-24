
" always copy to clipboard
set clipboard=unnamed

set sidescrolloff=5

" Change the map leader to the ,
let mapleader="," "Default mapleader is \

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Delete a word backwards
nnoremap dw vb"_d

" Delete letter without yank
nnoremap x "_x

" Jump out the curly brakets and isnert after that
inoremap <C-l> <C-o>A

" Esc when state is insert mode
inoremap <C-[> <Esc>

" Scroll setup
nnoremap <C-u> 10<C-u> 
nnoremap <C-d> 10<C-d>

" Save some strokes
" nnoremap ; :

" paste the last thing yanked, not deleted
nmap ,p "0p
nmap ,P "0P

" Yank from current cursor position to the end of the line 
nnoremap Y y$

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Turn off the hightlight
nmap <C-t> :nohlsearch<CR>


" Select all
nmap <C-a> gg<S-v>G

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
