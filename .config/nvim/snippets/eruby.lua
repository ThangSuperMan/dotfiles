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
local file_pattern = "*.erb"

-- Note: {{}}: Means escape curly brackets symbols

-- Website for lua pattern matching
-- https://www.educba.com/lua-regex/

-- Notes: () symbol sign means capture group
-- local myFirstAutoSnippet = s(
--   { trig = "digit(%a)", regTrig = true },
--   -- Function node
--   {
--     f(function(_, snip)
--       return snip.captures[1]
--     end),
--   }
-- )

local todo = s("todo", {
  t( "// TODO: " ),
})

local variable_no_return = s(
  "-",
  fmt([[ 
    <% {} %>
  ]],
    {
      i(1, ""),
    }
  )
)

local variable_have_return = s(
  "=",
  fmt([[ 
    <%= {} %>
  ]],
    {
      i(1, ""),
    }
  )
)

local each = s(
  "each",
  fmt([[ 
    <% @{}.each do |{}| %>
        {}
    <% end %>
  ]],
    {
      i(1, "collection"),
      i(2, "item"),
      i(3, ""),
    }
  )
)

local if_condition = s(
  "if",
  fmt([[ 
    <% if {} %>
        {}
    <% end %>
  ]],
    {
      i(1, "condition"),
      i(2, ""),
    }
  )
)

-- table.insert(snippets, normal_function)
table.insert(snippets, todo)
table.insert(snippets, variable_no_return)
table.insert(snippets, variable_have_return)
table.insert(snippets, if_condition)
table.insert(snippets, each)

-- End Refactoring --

return snippets, autosnippets
