-- Go
function attach_to_buffer(pattern, command)
local bufnr = vim.api.nvim_win_get_buf(0)

--                           On save event
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("ThangCoolHaha", { clear = true }),
	pattern = pattern,
	callback = function()
		vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "output of: main.go" })
		vim.fn.jobstart(command, {
			 stdout_buffered = true,
			-- Sending console
			on_stdout = function(_, data)
			if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end,
			-- Sending error
			on_stderr = function(_, data)
			if data then
					vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
				end
			end,
		})
	end,
})
end

vim.api.nvim_create_user_command("AutoRun", function()
  print "Autorun starts now."
  -- local bufnr = vim.fn.input "bufnr: "
  local pattern = vim.fn.input "Pattern: "
  local command = vim.split(vim.fn.input "Command: ", " ")
  -- attach_to_buffer(tonumber(bufnr), pattern, command)
  attach_to_buffer(pattern, command)
end, {})

-- nnoremap ,r :AutoRun
vim.api.nvim_set_keymap("n", ",r", ":AutoRun<CR>", {noremap = true})

-- vim.api.nvim_set_keymap("n", ",r", "<cmd>lua automaticGoRunOnSave()<CR>", {noremap = true})
-- -- Split window and go to that window and after that call the funtion
-- vim.api.nvim_set_keymap("n", ",r", ":vsplit<Return>:vertical resize 35<CR>:e gorun.txt<CR>:<cmd>lua attach_to_buffer()<CR>", {noremap = true})
