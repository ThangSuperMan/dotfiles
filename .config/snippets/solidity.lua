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
local file_pattern = "*.sol"

-- Note: {{}}: Means escape curly brackets symbols

local licence = s("licence", {
  t("// SPDX-Liences-Identifier: MIT;"),
}
)

local solidity_version_compile = s(
  { trig = "version", regTrig = false, hidden = true },
  fmt([[
    pragma solidity {};
  ]],
    {
      c(1, { i(1, ">=0.4.22 <0.7.0"), t "" }),
    }
  )
)

-- function functionName(args) scope returns (return types) {
-- {}
-- }

-- function buyTicket(uint256 _index) external payable {
local general_function = s(
  { trig = "func", regTrig = false, hidden = true },
  fmt([[
   function {}({}) {}{} {{
      {}
   }}
  ]],
    {
      i(1, "functionName"),
      c(2, { i(1, "arg"), t "" }),
      i(3, "public"),
      c(4, { t " returns (returnType)", t "" }),
      i(5, "// TODO"),
    }
  )
)

local for_loop = s(-- for([%w_]+) JS For Loop snippet{{{
  { trig = "for([%w_]+)", regTrig = true, hidden = true },
  fmt(
    [[
for (uint256 {} = 0; {} < {}; {}++) {{
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

local mapping = s(-- for([%w_]+) JS For Loop snippet{{{
  { trig = "map", regTrig = true, hidden = true },
  fmt(
    [[
mapping({} => {}) {} {};
    ]],
    {
      i(1, "key"),
      i(2, "value"),
      i(3, "public"),
      i(4, "variableName"),
    }
  )
) --}}}


table.insert(snippets, licence)
table.insert(snippets, solidity_version_compile)

-- Auto snippets when finished typed the whole key trigger (Regular expressions)
table.insert(autosnippets, for_loop)
-- table.insert(autosnippets, general_function)
table.insert(autosnippets, mapping)
-- table.insert(autosnippets, solidity_version_compile)

-- End Refactoring --

return snippets, autosnippets
