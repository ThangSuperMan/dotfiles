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
local file_pattern = "*.js"

-- Note: {{}}: Means escape curly brackets symbols

local console_log = s(
  { trig = "jj", regTrig = true },
  fmt([[
    console.log({});
  ]],
    {
      i(1, ""),
    }
  )
)

local ea = s(
  "ea",
  fmt([[ 
    explain analyze {}
  ]],
    {
      i(1, ""),
    }
  )
)

local comment = s(
  "comment",
  fmt([[ 
    /*
    */
  ]],
    {
    }
  )
)

table.insert(snippets, ea)
table.insert(snippets, comment)

-- End Refactoring --

return snippets, autosnippets
