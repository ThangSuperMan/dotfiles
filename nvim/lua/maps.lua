local keymap = vim.keymap
local opts = { noremap = true }

-- Set leader key
vim.g.mapleader = ' '
keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- turn spelling off or on
keymap.set('n', ',s', ':setlocal spell!<Cr>', opts)

-- Move to the start/end of current line
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', 'g_', opts)
keymap.set('v', 'H', '^', opts)
keymap.set('v', 'L', 'g_', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', ';', ':', opts)

-- Save with root permission (not working for now)
-- vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Jump to the last of the still inside the insert mode
keymap.set('i', '<c-l>', '<C-o>A')

keymap.set('n', '<C-e>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
keymap.set('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Scroll setup
keymap.set('n', '<C-d>', '10<C-d>')
keymap.set('n', '<C-u>', '10<C-u>')

-- Debugging
keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>')
keymap.set('n', '<leader>db', ':lua require"dap".reverse_continue()<CR>')
keymap.set('n', '<leader>ds', ':lua require"dap".step_over()<CR>')
keymap.set('n', '<leader>di', ':lua require"dap".step_into()<CR>')
keymap.set('n', '<leader>do', ':lua require"dap".step_out()<CR>')
keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>')
keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>')
keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
keymap.set('n', '<leader>dt', ':lua require("dap-go").debug_test()<CR>')
keymap.set('n', '<leader>dui', ':lua require("dapui").open()<CR>')
keymap.set('n', '<leader>duic', ':lua require("dapui").close()<CR>')
-- nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>

-- Use tab with text block
keymap.set('v', '<Tab>', '>gv')
keymap.set('v', '<S-Tab>', '<gv')

-- Move the selected line
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

keymap.set('n', '<S-Tab>', ':BufferPrevious<Return>')
keymap.set('n', '<Tab>', ':BufferNext<Return>')
keymap.set('n', '.c', ':BufferClose<Return>')

vim.opt.clipboard:append { 'unnamedplus' }
