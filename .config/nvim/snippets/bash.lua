local ls = require("luasnip") --{{{
local s = ls.s --> snippet
local i = ls.i --> insert node
local t = ls.t --> text node

local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local snippets, autosnippets = {}, {} --}}}

local group = vim.api.nvim_create_augroup("Bash script Snippets", { clear = true })
local file_pattern = "*.sh"

-- Note: {{}}: Means escape curly brackets symbols

local echo = s(
  { trig = "jj", regTrig = true },
  fmt([[
    echo {}
  ]],
    {
      i(1, ""),
    }
  )
)

-- table.insert(snippets, normal_function)
-- table.insert(snippets, console_log_object)
-- table.insert(snippets, function_component)
-- table.insert(snippets, const_function)

table.insert(autosnippets, echo)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
-- table.insert(autosnippets, console_log)
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, for_loop)
-- table.insert(autosnippets, if_snippet)
-- table.insert(autosnippets, function_snippet_func)
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, short_hand_if_statement)

-- End Refactoring --

return snippets, autosnippets
