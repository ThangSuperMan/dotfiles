-- return function()
--   local filetypes = {
--     'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx', 'rescript', 'markdown',
--   }

--   local treesitter = require'nvim-treesitter.configs'.setup {
--     highlight = {
--       enable = true,
--       disable = {
--       },
--     },
--     indent = {
--       enable = true,
--       disable = {},
--     },
--    ensure_installed = {
--      "prisma",
--      "javascript",
--      "java",
--      "dart",
--      "lua",
--      "tsx",
--      "go",
--      "org",
--      "fish",
--     },
--     autotag = {
--       enable = true,
--       filetypes = filetypes,
--     }
--   }

-- local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
-- end

return function()
	require("nvim-treesitter.install").prefer_git = true

	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			-- "javascript",
			-- "typescript",
			-- "json",
			-- "graphql",
			-- "tsx",
			-- "go",
			-- "hcl",
			-- "html",
			-- "jsdoc",
			-- "rust",
			-- "css",
			-- "bash",
			-- "lua",
			-- "scss",
			-- "vim",
		},
		autotag = { enable = true },
		indent = { enable = true },
		highlight = { enable = true, use_languagetree = true },
		context_commentstring = { enable = true },
		playground = {
			enable = true,
			disable = {},
			updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
			persist_queries = false, -- Whether the query persists across vim sessions
		},
	})
end
