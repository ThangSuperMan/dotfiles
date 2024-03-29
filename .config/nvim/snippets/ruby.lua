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

local group = vim.api.nvim_create_augroup("Typescript React Snippets", { clear = true })
local file_pattern = "*.rb"

local def = s(
  "def",
  fmt([[
    def {}
      {}
    end
  ]],
    {
      i(1, "method_name"),
      i(2, ""),
    }
  )
)

local print_line = s(
  { trig = "jj", regTrig = true },
  fmt([[
    puts {}
  ]],
    {
      i(1, ""),
    }
  )
)

local print_line_with_object = s(
  "lgo",
  fmt([[ 
    puts "{}: #{{{}}}"
  ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(snippets, def)
table.insert(snippets, print_line_with_object)

table.insert(autosnippets, print_line)
-- table.insert(autosnippets, short_hand_if_statement)

-- End Refactoring --

return snippets, autosnippets
