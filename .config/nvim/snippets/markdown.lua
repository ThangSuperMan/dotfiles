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

local group = vim.api.nvim_create_augroup("Markdown Snippets", { clear = true })
local file_pattern = "*.md"

-- Note: {{}}: Means escape curly brackets symbols

-- Website for lua pattern matching
-- https://www.educba.com/lua-regex/

local img = s(
  "img",
  fmt([[ 
    ![]({})
  ]],
    {
      i(1, "image_location"),
    }
  )
)

-- table.insert(snippets, normal_function)
table.insert(snippets, img)

-- End Refactoring --

return snippets, autosnippets

