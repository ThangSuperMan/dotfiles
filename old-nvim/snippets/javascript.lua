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

local function cs(trigger, nodes, opts) --{{{
	local snippet = s(trigger, nodes)
	local target_table = snippets

	local pattern = file_pattern
	local keymaps = {}

	if opts ~= nil then
		-- check for custom pattern
		if opts.pattern then
			pattern = opts.pattern
		end

		-- if opts is a string
		if type(opts) == "string" then
			if opts == "auto" then
				target_table = autosnippets
			else
				table.insert(keymaps, { "i", opts })
			end
		end

		-- if opts is a table
		if opts ~= nil and type(opts) == "table" then
			for _, keymap in ipairs(opts) do
				if type(keymap) == "string" then
					table.insert(keymaps, { "i", keymap })
				else
					table.insert(keymaps, keymap)
				end
			end
		end

		-- set autocmd for each keymap
		if opts ~= "auto" then
			for _, keymap in ipairs(keymaps) do
				vim.api.nvim_create_autocmd("BufEnter", {
					pattern = pattern,
					group = group,
					callback = function()
						vim.keymap.set(keymap[1], keymap[2], function()
							ls.snip_expand(snippet)
						end, { noremap = true, silent = true, buffer = true })
					end,
				})
			end
		end
	end

	table.insert(target_table, snippet) -- insert snippet into appropriate table
end --}}}'

cs( -- for([%w_]+) JS For Loop snippet{{{
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
      i(3, "// TODO"),
    }
  )
)

local console_log = s(
 "consol",
  fmt([[
    console.log({})
  ]], 
    {
      i(1, ""),
    }
  )
)

local const_function = s(
 "constf",
  fmt([[
    const {} = ({}) => {{
      {}
    }}
  ]], 
    {
      i(1, "myFunc"),
      i(2, ""),
      i(3, "// TODO"),
    }
  )
)

-- React with Javascript

local function_component = s(
 "fc",
  fmt([[
    import React from 'react'

    const {} = ({}) => {{
      return (
        {}
      )
    }}

    export default {}
  ]], 
    {
      i(1, "myComponent"),
      i(2, ""),
      i(3, "// TODO"),
      i(4, ""),
    }
  )
)

-- Use state

local use_state = s(
 "uses",
  fmt([[
    const [{}, {}] = React.useState({})
  ]], 
    {
      i(1, ""),
      i(2, ""),
      i(3, ""),
    }
  )
)

local use_effect = s(
 "usee",
  fmt([[
    React.useEffect(() => {{
      {}
    }}, [])
  ]], 
    {
      i(1, "// TODO"),
    }
  )
)

table.insert(snippets, normal_function)
table.insert(snippets, console_log)
table.insert(snippets, const_function)
table.insert(snippets, function_component)
table.insert(snippets, use_state)
table.insert(snippets, use_effect)

-- End Refactoring --

return snippets, autosnippets
