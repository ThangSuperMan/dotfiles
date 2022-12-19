return function()
	local cmd = vim.cmd
	cmd("syntax on")

	-- everforest theme
	vim.g.everforest_background = "dark"
	vim.g.everforest_enable_italic = 1
	vim.g.everforest_disable_italic_comment = 0
	cmd("set background=dark")
	cmd("set termguicolors")
	cmd("colorscheme everforest")
end

