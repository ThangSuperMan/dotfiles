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
      i(3, "// TODO:"),
    }
  )
)

local const_function = s(
  { trig = "constf", regTrig = true, hidden = true },
  fmt([[
    const {} = ({}) => {{
      {}
    }}
    {}
  ]],
    {
      i(1, "myFunc"),
      i(2, ""),
      i(3, "// TODO:"),
      i(4),
    }
  )
)

-- React with Javascript

-- local function_component = s(
--  "fc",
--   fmt([[
--     import React from 'react'
--
--     const {} = ({}) => {{
--       return (
--         {}
--       )
--     }}
--
--     export default {}
--   ]],
--     {
--       i(1, "myComponent"),
--       i(2, ""),
--       i(3, "// TODO:"),
--       i(4, ""),
--     }
--   )
-- )

-- Use state

local use_state = s(
  { trig = "uses", regTrig = true, hidden = true },
  fmt([[
    const [{}, {}] = useState({})
  ]],
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
    }
  )
)

local use_effect = s(
  { trig = "usee", regTrig = true, hidden = true },
  fmt([[
    React.useEffect(() => {{
      {}
    }}, [])
  ]],
    {
      i(1, "// TODO:"),
    }
  )
)

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

local console_log = s(
  { trig = "jj", regTrig = true },
  fmt([[
    console.log({})
  ]],
    {
      i(1, ""),
    }
  )
)

local function_component = s(
  { trig = "fc", regTrig = true, hidden = true },
  fmt(
    [[
    import React from 'react' 

    const {} = ({}) => {{
      return (
        {}
      )
    }} 

    export default {}
    ]],
    {
      i(1, "functionComponentName"),
      -- c(2, { i(1, "num"), sn(1, { i(1, "arr"), t(".length") }) }),
      c(2, { i(1, "arg"), i(1, "") }),
      i(3, "// TODO:"),
      -- repeate the insert node number one
      rep(1),
    }
  )
)



-- table.insert(snippets, normal_function)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
-- table.insert(autosnippets, console_log)
-- table.insert(autosnippets, const_function)
-- table.insert(autosnippets, if_snippet)
-- table.insert(autosnippets, function_snippet_func)
table.insert(autosnippets, function_component)
table.insert(autosnippets, use_state)
table.insert(autosnippets, use_effect)

-- End Refactoring --

return snippets, autosnippets
