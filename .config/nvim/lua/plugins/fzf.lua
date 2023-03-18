return function()
    vim.cmd('nnoremap ;f <cmd>Files<CR>')
    vim.cmd('nnoremap ;r <cmd>Rg<CR>')
    vim.cmd('nnoremap <nowait><Leader>b <cmd>Buffers<CR>')
    vim.cmd('nnoremap <Leader>s <cmd>GFiles?<CR>')
end
