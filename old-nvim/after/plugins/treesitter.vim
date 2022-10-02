lua << EOF

require'nvim-treesitter.configs'.setup {
	highlight = {
    enable = true,
    disable = {},
  },
	indent = {
    enable = true,
    disable = {},
  },
 ensure_installed = {
    "html",
    "ruby",
    "lua",
    "css",
    "solidity",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

EOF