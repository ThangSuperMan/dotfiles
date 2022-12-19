return function()
local treesitter = require'nvim-treesitter.configs'.setup {
	highlight = {
    enable = true,
    disable = {
      "solidity",
    },
  },
	indent = {
    enable = true,
    disable = {},
  },
 ensure_installed = {
   "prisma",
   "javascript",
   "lua",
   "tsx",
   "go",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
end
