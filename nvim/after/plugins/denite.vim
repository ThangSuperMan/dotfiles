" Requirement
" Make sure that install the rg (library)
" Using command brew install rg
"
" Denite
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
"
" " Load the vim-devicons with denite
call denite#custom#source('file/rec,file_mru,file/old,buffer,directory/rec,directory_mru', 'converters', ['devicons_denite_converter'])

" Ignore all folders in .gitignore file and adding the customization for the
" Searching popup window
if executable("rg")
    call denite#custom#var('file/rec', 'command',
   \ ['rg', '--files', '--glob', '!.git', '--color', 'never'])
    call denite#custom#var('grep', {
   \ 'command': ['rg'],
   \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
   \ 'recursive_opts': [],
   \ 'pattern_opt': ['--regexp'],
   \ 'separator': ['--'],
   \ 'final_opts': [],
   \ })
endif

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" Rg command on grep source
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'nnoremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previou_line>', 'nnoremap')

" grep
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    let l:path = expand('%:p:h')
    if has_key(defx#get_candidate(), 'action__path')
      let l:path = fnamemodify(defx#get_candidate()['action__path'], ':p:h')
    endif
    execute(':Denite -buffer-name=grep-buffer-denite -no-empty '.join(s:denite_options_array, ' ').' grep -path='.l:path)
  endif
endfunction

 " use floating
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.7

call denite#custom#option('_', {
		\ 'cached_filter': v:true,
		\ 'cursor_shape': v:true,
		\ 'cursor_wrap': v:true,
    \ 'highlight_matched_range': 'pandocStrikeoutTable',
		\ 'highlight_filter_background': 'DeniteFilter',
		\ 'highlight_matched_char': 'None',
    \ 'match_highlight': v:true,
		\ 'matchers': 'matcher/fruzzy',
		\ 'prompt': 'ﬦ ',
		\ 'split': 'floating',
		\ 'start_filter': v:true,
		\ 'statusline': v:false,
\ })

 " use floating
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.7

function! s:denite_detect_size() abort
    let s:denite_winheight = float2nr(&lines * s:denite_win_height_percent)
    let s:denite_winrow = &lines > s:denite_winheight ? (&lines - s:denite_winheight) / 2 : 0
    let s:denite_winwidth = float2nr(&columns * s:denite_win_width_percent)
    let s:denite_wincol = &columns > s:denite_winwidth ? (&columns - s:denite_winwidth) / 2 : 0
    call denite#custom#option('_', {
          \ 'wincol': s:denite_wincol,
          \ 'winheight': s:denite_winheight,
          \ 'winrow': s:denite_winrow,
          \ 'winwidth': s:denite_winwidth,
          \ })
  endfunction
   augroup denite-detect-size
    autocmd!
    autocmd VimResized * call <SID>denite_detect_size()
  augroup END
  call s:denite_detect_size()

call denite#custom#option('search', { 'start_filter': 0, 'no_empty': 1 })
call denite#custom#option('list', { 'start_filter': 0 })
call denite#custom#option('jump', { 'start_filter': 0 })
call denite#custom#option('git', { 'start_filter': 0 })
call denite#custom#option('mpc', { 'winheight': 20 })

nnoremap <silent> ;r :<C-u>Dgrep .<CR>
nnoremap <silent> ;f :<C-u>Denite file/rec<CR>
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>
nnoremap <silent> ;p :<C-u>Denite -resume<CR> 
