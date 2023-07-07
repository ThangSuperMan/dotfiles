return function()
  vim.keymap.set("n", ";f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })
  vim.keymap.set("n", ";r", "<cmd>lua require('fzf-lua').live_grep()<CR>", { silent = true })
  vim.keymap.set("n", ";g", "<cmd>lua require('fzf-lua').git_status()<CR>", { silent = true })
end
