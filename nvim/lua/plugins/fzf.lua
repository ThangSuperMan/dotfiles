return function()
    vim.cmd([[command! -bang -nargs=* -complete=dir Files call fzf#vim#files(<q-args>, fzf#vim#with_preview({'gitignore': 1}), <bang>0)]])
    vim.cmd('nnoremap ;f <cmd>Files<CR>')
    vim.cmd('nnoremap ;r <cmd>Rg<CR>')
    vim.cmd('nnoremap <nowait><Leader>b <cmd>Buffers<CR>')
    vim.cmd('nnoremap <Leader>s <cmd>GFiles?<CR>')
end
