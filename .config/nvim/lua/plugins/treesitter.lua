return function()
  local filetypes = {
    'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'markdown',
  }

  local treesitter = require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      disable = {
      },
    },
    indent = {
      enable = true,
      disable = {},
    },
   ensure_installed = {
     "prisma",
     "javascript",
     "java",
     "dart",
     "lua",
     "tsx",
     "go",
     "org",
     "fish",
    },
    autotag = {
      enable = true,
      filetypes = filetypes,
    }
  }

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
end
