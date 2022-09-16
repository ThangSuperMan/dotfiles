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
  t( "// SPDX-Liences-Identifier: MIT;"),
}
)

local solidity_version_compile = s(
  "sol-v", 
  fmt([[
    pragma solidity {};
  ]],
    {
      i(1, "solidityVersionCompile"),
    }
  )
)

local contract = s(
  "contr", 
  fmt([[
    contract {} {{
      {}
    }}
  ]],
    {
      i(1, "contractName"),
      i(2, "// TODO"),
    }
  )
)

-- function buyTicket(uint256 _index) external payable {
local general_function = s(
  "func", 
  fmt([[
   function {}({}) {} {} {{
      {}
   }}
  ]],
    {
      i(1, "functionName"),
      i(2, ""),
      i(3, "private"),
      c(4, { t "returns (return type)", t ""}),
      i(5, "// TODO"),
    }
  )
)

local for_loop = s(
  "for-loop", 
  fmt([[
    for (uint256 {} = 0; {} < {}; {}) {{
      {}
    }}

  ]],
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
      i(4, ""),
      i(5, "// TODO"),
    }
  )
)

table.insert(snippets, licence)
table.insert(snippets, solidity_version_compile)
table.insert(snippets, contract)
table.insert(snippets, general_function)
table.insert(snippets, for_loop)

-- End Refactoring --

return snippets, autosnippets
