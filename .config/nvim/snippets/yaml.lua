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

-- local group = vim.api.nvim_create_augroup("Typescript React Snippets", { clear = true })
-- local file_pattern = "*.yaml"

-- -- Docker
-- local structure_docker_compose = s(
--   "setup",
--   fmt([[
--     version: '{}' 
--     services: 
--       {}:
--         image: {}
--         ports: 
--           - "{}:{}"
--         environment: 
--           {}
--   ]],
--     {
--       i(1, "composeVersion"),
--       i(2, "containerName"),
--       i(3, "image"),
--       i(4, "hostPort"),
--       i(5, "containerPort"),
--       i(6, "envVariables"),
--     }
--   )
-- )

-- -- Auto snippets when finished typed the whole key trigger (Regular expressions)
-- table.insert(snippets, structure_docker_compose)
-- -- table.insert(autosnippets, short_hand_if_statement)

-- -- End Refactoring --

-- return snippets, autosnippets
