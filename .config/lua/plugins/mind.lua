return function()
  require'mind'.setup {
    -- ui = {
    --   width = 40,
    --   highlight = {
    --     node_root = 'Number',
    --   },
    -- }
  }

vim.cmd([[nnoremap <leader>m :MindOpenMain<cr>]])
vim.cmd([[nnoremap <leader>M :MindClose<cr>]])
end
