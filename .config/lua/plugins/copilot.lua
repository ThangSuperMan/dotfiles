return function()
  vim.cmd([[imap <silent><script><expr> <C-c> copilot#Accept("\<CR>")]])
  vim.g.copilot_no_tab_map = true
  vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=0]]
end
