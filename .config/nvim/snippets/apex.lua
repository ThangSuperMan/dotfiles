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

local group = vim.api.nvim_create_augroup("Apex Snippets", { clear = true })
local file_pattern = "*.apex"

-- Note: {{}}: Means escape curly brackets symbols

local class = s(
  "class",
  fmt([[ 
    public with sharing class {} {{
      {}
    }}
  ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)

local debug = s(
  "debug",
  fmt([[ 
    System.debug('{}: ' + {});
  ]],
    {
      i(1, ""),
      i(2, ""),
    }
  )
)


-- local function_snippet_func = s({ trig = "func" }, vim.deepcopy(function_fmt)) --}}}

table.insert(snippets, class)
table.insert(snippets, debug)

-- table.insert(autosnippets, console_log )

-- End Refactoring --

return snippets, autosnippets
