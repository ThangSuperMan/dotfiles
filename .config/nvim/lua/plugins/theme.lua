return function()
  local cmd = vim.cmd
  cmd("syntax on")

  -- everforest theme
  -- Original
  vim.g.everforest_background = "soft"
  vim.g.everforest_diagnostic_line_highlight = 1
  vim.g.everforest_enable_italic = 1
  vim.g.everforest_disable_italic_comment = 0
  -- cmd("set background=dark")
  cmd("set background=dark")
  cmd("set termguicolors")
  cmd("colorscheme everforest")

  -- vim.fn.sign_define({
  --   {
  --     name = 'DiagnosticSignError',
  --     text = '',
  --     texthl = 'DiagnosticSignError',
  --     linehl = 'ErrorLine',
  --   },
  --   {
  --     name = 'DiagnosticSignWarn',
  --     text = '',
  --     texthl = 'DiagnosticSignWarn',
  --     linehl = 'WarningLine',
  --   },
  --   {
  --     name = 'DiagnosticSignInfo',
  --     text = '',
  --     texthl = 'DiagnosticSignInfo',
  --     linehl = 'InfoLine',
  --   },
  --   {
  --     name = 'DiagnosticSignHint',
  --     text = '',
  --     texthl = 'DiagnosticSignHint',
  --     linehl = 'HintLine',
  --   },
  -- })
end
