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

" call denite#custom#var('file/rec', 'command')


" Ignore all folders in .gitignore file and adding the customization for the
" Searching popup window
if executable("rg")
  echo 'hi there'
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

" call denite#custom#var('file/rec', 'command', 
"       \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])

call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command', ['git', 'ls-files', '-co', '--exclude-standard'])

" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" use floating
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.7

" 1 means true and 0 Means false
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 0,
\ 'source_names': 'short',
\ 'prompt': '>',
\ 'highlight_matched_char': 'None',
\ 'highlight_matched_range': 'pandocStrikeoutTable',
\ 'highlight_window_background': 'StatusLine',
\ 'highlight_filter_background': 'ColorColumn',
\ 'match_highlight': v:true,
\ 'winheight': float2nr(&lines * s:denite_win_height_percent),
\ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
\ 'wincol': &columns / 8,
\ 'winrow': &lines / 7,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

" Call the method customize
call s:profile(s:denite_options)

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

nnoremap <silent> ;r :<C-u>Dgrep .<CR>
nnoremap <silent> ;f :<C-u>Denite file/rec<CR>
nnoremap <silent> ;; :<C-u>Denite command command_history<CR>
nnoremap <silent> ;p :<C-u>Denite -resume<CR>

