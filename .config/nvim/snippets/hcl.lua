-- local ls = require("luasnip") --{{{
-- local s = ls.s --> snippet
-- local i = ls.i --> insert node
-- local t = ls.t --> text node

-- local d = ls.dynamic_node
-- local c = ls.choice_node
-- local f = ls.function_node
-- local sn = ls.snippet_node

-- local fmt = require("luasnip.extras.fmt").fmt
-- local rep = require("luasnip.extras").rep

-- local snippets, autosnippets = {}, {} --}}}

-- local group = vim.api.nvim_create_augroup("Css Snippets", { clear = true })
-- local file_pattern = "*.hcl"

-- local declare_variable = s(
--   "var",
--   fmt([[
--     variable "{}" {{
--         type = {}
--         description = {}
--         default = {}
--     }}
--   ]],
--   {
--     i(1, "variableName"),
--     i(2, "string"),
--     i(3, ""),
--     i(4, ""),
--   }
-- ))

-- table.insert(snippets, declare_variable)

-- -- End Refactoring --

-- return snippets, autosnippets
