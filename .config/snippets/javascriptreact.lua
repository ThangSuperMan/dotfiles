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
local file_pattern = "*.jsx"

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
  "constf",
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

local class_name = s(
  "cln",
  fmt([[ 
    className="{}"
  ]],
    i(1, "")
  )
)

-- Use state

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

local use_effect = s(
  "usee",
  fmt([[
    React.useEffect(() => {{
      {}
    }}, []);
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
  "jj",
  fmt([[
    console.log({});
  ]],
    {
      i(1, ""),
    }
  )
)

local console_log_object = s(
  "lgo",
  fmt([[ 
    console.log("{} :>> ", {});
  ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)

local function_component = s(
  { trig = "fc", regTrig = true, hidden = true },
  fmt(
    [[
    import React from 'react'; 

    const {} = ({}) => {{
      return (
        {}
      );
    }} 

    export default {};
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


local for_loop = s(-- for([%w_]+) JS For Loop snippet{{{
  { trig = "for([%w_]+)", regTrig = true, hidden = true },
  fmt(
    [[
for (let {} = 0; {} < {}; {}++) {{
  {}
}}
{}
    ]],
    {
      d(1, function(_, snip)
        return sn(1, i(1, snip.captures[1]))
      end),
      rep(1),
      c(2, { i(1, "num"), sn(1, { i(1, "arr"), t(".length") }) }),
      rep(1),
      i(3, "// TODO:"),
      i(4),
    }
  )
) --}}}

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
  {}
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

local short_hand_if_fmt = fmt(--{{{
  [[
if ({}) {}
{}
    ]],
  {
    d(1, function(_, snip)
      -- return sn(1, i(1, snip.captures[1]))
      return sn(1, t(snip.captures[1]))
    end),
    d(2, function(_, snip)
      return sn(2, t(snip.captures[2]))
    end),
    i(3, ""),
  }
)
local short_hand_if_statement = s({ trig = "if[>%s](.+)>>(.+)\\", regTrig = true, hidden = true }, short_hand_if_fmt)

local function_fmt = fmt(--{{{
  [[
function {}({}) {{
  {}
}}
    ]],
  {
    i(1, "myFunc"),
    c(2, { i(1, "arg"), i(1, "") }),
    i(3, "//TODO:"),
  }
)

local function_snippet_func = s({ trig = "func" }, vim.deepcopy(function_fmt)) --}}}

-- table.insert(snippets, normal_function)
-- table.insert(snippets, console_log)
table.insert(snippets, console_log_object)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(autosnippets, console_log)
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, for_loop)
-- table.insert(autosnippets, if_snippet)
-- table.insert(autosnippets, function_snippet_func)
-- table.insert(autosnippets, function_component)
-- table.insert(autosnippets, short_hand_if_statement)

-- End Refactoring --

return snippets, autosnippets
