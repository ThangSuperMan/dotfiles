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
local file_pattern = "*.rust"

local use_state = s(
  "uses",
  fmt([[
    const [{}, {}] = React.useState<{}>({});
  ]],
    {
      i(1, ""),
      i(2, ""),
      c(3, { i(1, "TypeOf"), i(1, "") }),
      i(4, ""),
    }
  )
)

-- Texts
local trait_debug = s("debug", {
  t( "#[derive(Debug)]" ),
})

local string_from = s(
  "sf",
  fmt([[
    String::from("{}");
  ]],
    {
      i(1, ""),
    }
  )
)

local main = s(
  "main",
  fmt([[
    fn main() {{
      {}
    }}
  ]],
    {
      i(1, ""),
    }
  )
)

local print_line = s(
  { trig = "jj", regTrig = true },
  fmt([[
    println!({});
  ]],
    {
      i(1, ""),
    }
  )
)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(autosnippets, print_line)
table.insert(snippets, string_from)
table.insert(snippets, trait_debug)
table.insert(snippets, main)
-- table.insert(snippets, )
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, for_loop)
-- table.insert(autosnippets, if_snippet)
-- table.insert(autosnippets, function_snippet_func)
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, short_hand_if_statement)

-- End Refactoring --

return snippets, autosnippets
