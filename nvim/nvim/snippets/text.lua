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

local group = vim.api.nvim_create_augroup("text snippets", { clear = true })
local file_pattern = "*.txt"

-- Layout

local tiny_dot_symbol = s(
	{ trig = "dot", regTrig = true, hidden = true },
  fmt(
    [[
    {}
    ]],
    {
      i(1, "•"),
    }
  )
)

local check_box_symbol = s(
	{ trig = ".c", regTrig = true, hidden = true },
  fmt(
    [[
    {}
    ]],
    {
      i(1, "")
    }
  )
)

local rocket_symbol = s(
	{ trig = ".r", regTrig = true, hidden = true },
  fmt(
    [[
    {}
    ]],
    {
      i(1, "🚀")
    }
  )
)


-- ✓
local checked_box_symbol = s(
	{ trig = ".v", regTrig = true, hidden = true },
  fmt(
    [[
    {}
    ]],
    {
      i(1, "✅")
    }
  )
)

local coffee_symbol = s(
	{ trig = "coffee", regTrig = true, hidden = true },
  fmt(
    [[
    {}
    ]],
    {
      i(1, "☕")
    }
  )
)

table.insert(autosnippets, tiny_dot_symbol)
table.insert(autosnippets, rocket_symbol)
table.insert(autosnippets, check_box_symbol)
table.insert(autosnippets, checked_box_symbol)
table.insert(autosnippets, coffee_symbol)

-- End Refactoring --

return snippets, autosnippets
