let g:db_ui_use_nerd_fonts = 1

let g:dbs = {
\ 'dev': 'postgres://postgres:@localhost:5432/bank',
\ 'wp': 'mysql://root@localhost/banking_system',
\ }
" \ 'staging': 'postgres://postgres:mypassword@localhost:5432/my-staging-db',

" Make the cmp working with sql
autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

" let g:db_ui_save_location = '~/temporary'

let g:db_ui_tmp_query_location = '~/queries'
