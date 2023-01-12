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
local file_pattern = "*.go"

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

local hello = s(
  "hello",
  fmt([[
    package main

    import "fmt"

    func main() {{
      fmt.Println("{}")
    }}
  ]],
    {
      i(1, "hello"),
    }
  )
)

local print_line = s(
  { trig = "jj", regTrig = true },
  fmt([[
    fmt.Println({})
  ]],
    {
      i(1, ""),
    }
  )
)

local print_object = s(
  "pO",
  fmt([[
    fmt.Println("{} :>> ", {})
  ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)

local halt_on = s(
  "haltOn",
  fmt([[
    func haltOn(err error) {{
      if err != nil {{
        {}
      }}
    }}
  ]],
    {
      i(1, 'log.Fatal("Error here: ", err)'),
    }
  )
)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(autosnippets, print_line)
table.insert(snippets, print_object)
table.insert(snippets, hello)
table.insert(snippets, halt_on)
-- table.insert(autosnippets, short_hand_if_statement)

-- End Refactoring --

return snippets, autosnippets
