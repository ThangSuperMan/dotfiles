lua << EOF

require'nvim-treesitter.configs'.setup {
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
    "html",
    "ruby",
    "lua",
    "javascript",
    "go",
    "css",
    "json",
    "solidity",
    "prisma",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF
