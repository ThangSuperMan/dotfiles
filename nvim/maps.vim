" Change the map leader to the ,
let mapleader=" " "Default mapleader is \

let localleader="\\"

" Ruby 
" nnoremap gv :Tview<cr>
" nnoremap gm :Tmodel<cr>

" Org mode
" Completed checkbox
" nnoremap <space>cc :


" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

"Split join pugin
nnoremap gj :SplitjoinJoin<cr>
nnoremap gs  SplitjoinSplit<cr>

nnoremap zl :HopLineStart<cr>

" Find the recents visited file by using Startify
nnoremap <space>fr :Startify<cr>

nnoremap <leader>C :CheatSH<CR>

" Show Full Path To Here:
nnoremap <space>? :echo expand("%:p")<CR>

" Toggle Line Number:
nnoremap <space>n :set number!<CR>

" Turn off highlight on search
nnoremap <space>h :set nohlsearch!<CR>

" Disable the treesitter hightlight
nnoremap <space>t :TSToggle highlight<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" Save some strokes :)
nnoremap ; :

" toggle spellcheck
nmap <silent> <leader>s :set spell!<CR>

" Make windows to be basically the same size
nnoremap <leader>= <C-w>=

" greatest remap ever
xnoremap <leader>p "_dP

" turn spelling off or on
nnoremap ,s :setlocal spell!<Cr>

" Use tab with text block
vmap <Tab> >gv
vmap <S-Tab> <gv

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" Delete without yank
nnoremap <leader>d "_d

" Delete letter without yank
nnoremap x "_x

" Go to start or end of line easier
nnoremap H ^
xnoremap H ^
nnoremap L g_
xnoremap L g_

" Yank from current cursor position to the end of the line 
nnoremap Y y$

" Jump out the curly brakets and isnert after that
" inoremap <C-]> <C-o>A
inoremap <silent> <c-l> <C-o>A

" Esc when state is insert mode
inoremap <C-[> <Esc>

" Move the selected line
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Scroll setup
nnoremap <C-d> 10<C-d>
nnoremap <C-u> 10<C-u>

nmap = :res +5<CR> " increase pane by 2
nmap - :res -5<CR> " decrease pane by 2
nmap ] :vertical res +5<CR> " vertical increase pane by 2
nmap [ :vertical res -5<CR> " vertical decrease pane by 2

" Copy whole text in file
" nnoremap ya :%y+<CR>

nmap ,a gg<S-v>G

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
