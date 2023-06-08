return function()
  local cmd = vim.cmd
  cmd("syntax on")

  -- everforest theme
  vim.g.everforest_diagnostic_line_highlight = 1
  vim.g.everforest_background = "soft"
  vim.g.everforest_disable_italic_comment = 0
  vim.g.everforest_transparent_background = 1
  cmd("set background=dark")
  -- cmd("set background=light")
  cmd("set termguicolors")
  cmd("colorscheme everforest")

  -- cmd("colorscheme nvcode")
  -- cmd("set background=light")
  -- cmd("colorscheme PaperColor")

  -- cmd("colorscheme tokyonight-day")
  -- cmd("colorscheme edge")
  -- cmd("colorscheme nord")

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
