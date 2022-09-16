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

local group = vim.api.nvim_create_augroup("Css Snippets", { clear = true })
local file_pattern = "*.css"

-- Layout

local flex_center = s("flex-center", {
  t( "display: flex;" ),
  t( {"", "align-items: center;"} ),
  t( {"", "justify-content: center;"} )
})

  local grid_center = s("grid-center", {
  t( "display: grid;" ),
  t( {"", "place-items: center;"} ),
})

-- Shape

local circle = s(
  "circle",
  fmt([[
    width: {};
    height: {};
    border-radius: 100em;
  ]],
  {
    i(1, "100px"),
    i(2, "100px"),
  }
 )
)

local bg_gradient = s("bg-gradient", {
  t( "background: linear-gradient(45deg, #ff216d, #2196f3);" ),
})

local abs_center = s("abs-center", {
  t( "position: absolute;" ),
  t({"", "top: 50%;" }),
  t({"", "left: 50%;" }),
  t({"", "transform: translate(-50%, -50%);" }),
})


table.insert(snippets, grid_center)
table.insert(snippets, flex_center)
table.insert(snippets, abs_center)
table.insert(snippets, circle)
table.insert(snippets, bg_gradient)

-- End Refactoring --

return snippets, autosnippets
