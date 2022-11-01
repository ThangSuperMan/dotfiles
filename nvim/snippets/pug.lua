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
local file_pattern = "*.pug"

local basicPugTemplate = s(
  "pug",
  fmt([[
    doctype html
    html(lang="en")
      head
        meta(charset="UTF-8")
        meta(name="viewport", content="width=device-width, inital-scale=1.0")
        title Document
      body
        {}
  ]],
    {
      i(1, "yourContent"),
    }
  )
)

table.insert(autosnippets, basicPugTemplate)
