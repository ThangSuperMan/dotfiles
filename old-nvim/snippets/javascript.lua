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
local file_pattern = "*.js"

local myFirstSnippet = s("myFirstSnippet", { 
  t("Hi! This is my first snippet in lua"),
  i(1, "placeholder_text")
})

-- local fun = s("fun", {
--   t("function "),
--   i(1, "name_func"),
--   t("() {"),
--   t({ "", "}" }),
-- })

-- Note: {{}}: Means escape curly brackets symbols

local normal_function = s(
 "func",
  fmt([[
    function {}({}) {{
      {}
    }}
  ]], 
    {
      i(1, "myFunc"),
      -- Choice node
      -- c(2, { t(""), i(1, "myArg") }),
      i(2, ""),
      i(3, "// TODO"),
    }
  )
)

local const_function = s(
 "constf",
  fmt([[
    const {} = ({}) => {{
      {}
    }}
  ]], 
    {
      i(1, "myFunc"),
      i(2, ""),
      i(3, "// TODO"),
    }
  )
)

-- React with Javascript

local function_component = s(
 "fc",
  fmt([[
    import React from 'react'

    const {} = ({}) => {{
      return (
        {}
      )
    }}

    return {}
  ]], 
    {
      i(1, "myComponent"),
      i(2, ""),
      i(3, "// TODO"),
      i(4, ""),
    }
  )
)

-- Use state

local use_state = s(
 "uses",
  fmt([[
    const [{}, {}] = React.useState({})
  ]], 
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
    }
  )
)

local use_effect = s(
 "usee",
  fmt([[
    React.useEffect(() => {{
      {}
    }}, [])
  ]], 
    {
      i(1, "// TODO"),
    }
  )
)

table.insert(snippets, normal_function)
table.insert(snippets, const_function)
table.insert(snippets, function_component)
table.insert(snippets, use_state)
table.insert(snippets, use_effect)

-- End Refactoring --

return snippets, autosnippets
