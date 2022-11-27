let g:db_ui_use_nerd_fonts = 1

let g:dbs = {
\ 'dev': 'postgres://postgres:@localhost:5432/learning',
\ 'wp': 'mysql://root@localhost/banking_system',
\ }
" \ 'staging': 'postgres://postgres:mypassword@localhost:5432/my-staging-db',


autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.ejs, *.tsx, *.js'
