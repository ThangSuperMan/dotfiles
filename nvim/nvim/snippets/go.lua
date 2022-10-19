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

local group = vim.api.nvim_create_augroup("Javascript Snippets", { clear = true })
local file_pattern = "*.go"

local drop_table = s(
 "drop-table",
  fmt([[
    drop table {};
  ]], 
    {
      i(1, "tableName"),
    }
  )
)

local select_all = s(
 "s*",
  fmt([[
    select * from {}
  ]], 
    {
      i(1, "tableName"),
    }
  )
)

local function_snippet = s(
  { trig = "func", regTrig = true },
  fmt([[
    func {}({}) {{
      {}
    }}
  ]], 
    {
      i(1, ""),
      c(2, { i(1, "arg"), i(1, "")}),
      i(3, "//TODO:"),
    }
  )
)

local if_fmt_arg = { --{{{
	i(1, ""),
	c(2, { i(1, "LHS"), i(1, "10") }),
	c(3, { i(1, "==="), i(1, "<"), i(1, ">"), i(1, "<="), i(1, ">="), i(1, "!==") }),
	i(4, "RHS"),
	i(5, "//TODO:"),
}

local if_fmt_1 = fmt(
	[[
{}if ({} {} {}) {};
    ]],
	vim.deepcopy(if_fmt_arg)
)

local if_fmt_2 = fmt(
	[[
{}if ({} {} {}) {{
  {};
}}
    ]],
	vim.deepcopy(if_fmt_arg)
)

local if_snippet = s(
	{ trig = "ifs", regTrig = false, hidden = true },
	c(1, {
    if_fmt_2,
		if_fmt_1,
	})
) --}}}

 local print_format = s(
  { trig = "jj", regTrig = true },
  fmt([[
    fmt.Println("{}")
  ]], 
    {
      i(1, ""),
    }
  )
)

table.insert(snippets, select_all)
table.insert(snippets, drop_table)
table.insert(snippets, if_else_statement)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(autosnippets, print_format )
table.insert(autosnippets, if_snippet)
table.insert(autosnippets, function_snippet)

-- End Refactoring --

return snippets, autosnippets

