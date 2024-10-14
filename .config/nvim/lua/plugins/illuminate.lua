return function()
-- default configuration
require('illuminate').configure({
  providers = {
    "lsp",
    "treesitter",
    "regex",
  },
  delay = 200,
  filetypes_denylist = {
    "dirvish",
    "fugitive",
    "alpha",
    "NvimTree",
    "packer",
    "neogitstatus",
    "Trouble",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
    "DressingSelect",
    "TelescopePrompt",
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  })

   -- change the highlight style
   vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
   vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
   vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })

   --- auto update the highlight style on colorscheme change
   vim.api.nvim_create_autocmd({ "ColorScheme" }, {
     pattern = { "*" },
     callback = function(ev)
       vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
       vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "Visual" })
       vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "Visual" })
     end
   })

end
