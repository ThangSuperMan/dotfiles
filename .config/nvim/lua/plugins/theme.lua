return function()
  local cmd = vim.cmd
  cmd("syntax on")

  -- everforest theme
  vim.g.everforest_diagnostic_line_highlight = 1
  vim.g.everforest_background = "soft"
  vim.g.everforest_disable_italic_comment = 0
  vim.g.everforest_transparent_background = 1
  cmd("set background=dark")
  cmd("set termguicolors")
  cmd("colorscheme everforest")
  -- cmd("colorscheme tokyonight-night")
  -- cmd("set background=light")
  -- cmd("set background=dark")
  -- cmd("colorscheme catppuccin-frappe")
  -- cmd("colorscheme rose-pine")

  -- local catppuccin = require("catppuccin")

  -- catppuccin.setup({
  --   integrations = {
  --     ts_rainbow = true,
  --   },
  --   color_overrides = {
  --     mocha = {
  --       text = "#F4CDE9",
  --       subtext1 = "#DEBAD4",
  --       subtext0 = "#C8A6BE",
  --       overlay2 = "#B293A8",
  --       overlay1 = "#9C7F92",
  --       overlay0 = "#866C7D",
  --       surface2 = "#705867",
  --       surface1 = "#5A4551",
  --       surface0 = "#44313B",
  --       base = "#352939",
  --       mantle = "#211924",
  --       crust = "#1a1016",
  --     },
  --   },
  -- })

-- colorscheme catppuccin
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
