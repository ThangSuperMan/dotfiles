return function()
  -- vim-test strategy
  -- vim.g['test#strategy'] = 'vimux'
  -- -- vim-test keybindings
  -- vim.cmd("let test#strategy = 'vimux'")
  vim.keymap.set('n', '<space>tt', '<cmd>TestNearest<CR>', { desc = "Test nearest" })
  vim.keymap.set('n', '<space>tl', '<cmd>TestLast<CR>', { desc = "Test last" })
  vim.keymap.set('n', '<space>tf', '<cmd>TestFile<CR>', { desc = "Test file" })
  vim.keymap.set('n', '<Leader>ts', '<cmd>TestSuite<CR>', {desc = "Test suite" })
end
