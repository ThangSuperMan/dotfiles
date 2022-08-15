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
local file_pattern = "*.html"

local flex_center = s("flex-center", {
  t( "display: flex;" ),
  t( {"", "align-items: center;"} ),
  t( {"", "justify-content: center;"} )
})

local html = s(
  "html",
  fmt([[
    <!doctype html>
    <html>

    <head>
      <meta charset="utf-8"
      <title>{}</title>
      <link rel="stylesheet" type="text/css" href="style.css" />
    </head>

    <body>
      <h1>Hello</h1>
    </body>

    </html>
  ]],
  {
    i(1, "My title website"),
  }
 )
)

table.insert(snippets, html)

-- End Refactoring --

return snippets, autosnippets

