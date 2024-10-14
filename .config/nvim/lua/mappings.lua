local keymap = vim.keymap
local opts = {noremap = true}

-- Set leader key
vim.g.mapleader = ' '
keymap.set('n', 'x', '"_x')

-- Use shift + arrow to resize windows
keymap.set('n', '<S-Up>', '<M-j> :resize -5<CR>', {noremap = true})
keymap.set('n', '<S-Down>', '<M-k> :resize +5<CR>', {noremap = true})
keymap.set('n', '<S-Left>', '<M-h> :vertical resize -5<CR>', {noremap = true})
keymap.set('n', '<S-Right>', '<M-l> :vertical resize +5<CR>', {noremap = true})

-- Format ruby code
-- keymap.set('n', '<leader>rf', ':RuboCopFix<CR>', { noremap = true })

-- Float terminal
vim.g.floaterm_keymap_toggle = '<C-\\>'

-- Quick ESC
keymap.set('i', 'jk', '<esc>', {noremap = true, silent = true})

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', {noremap = true})

-- Convert a symbol to another symbol
-- vim.api.nvim_set_keymap('n', '<leader>cq', ':%s/”/’/g<CR>', { noremap = true, silent = true })

-- Telescope
-- vim.api.nvim_set_keymap('n', ';f', ':Telescope find_files<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', ';r', ':Telescope grep_string<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', ';;', ':Telescope resume<CR>', { noremap = true })

-- Flutter tool
-- keymap.set('n', '<leader>fd', '<cmd> FlutterDevices <CR>')
-- keymap.set('n', '<leader>fD', '<cmd> FlutterDetatch <CR>')
-- keymap.set('n', '<leader>ff', '<cmd> Flutter run <CR>')
-- keymap.set('n', '<leader>fq', '<cmd> Flutter quite <CR>')
-- keymap.set('n', '<leader>fr', '<cmd> Flutter reload <CR>')
-- keymap.set('n', '<leader>fR', '<cmd> Flutter restart <CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

keymap.set('n', '<leader>n', ':set number!<CR>', {noremap = true})

-- Markdown
keymap.set('n', '<leader>mp', ':MarkdownPreview<CR>', {noremap = true})

-- Harpoon
keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>',
           {noremap = true})
keymap.set('n', '<leader>hm',
           ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
           {noremap = true})

-- Ctrl-s to save
keymap.set('n', '<C-s>', ':w!<CR>', {noremap = true})
keymap.set('i', 'ww', '<ESC>:w!<CR>', {noremap = true})

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- turn spelling off or on
keymap.set('n', ',s', ':setlocal spell!<CR>', opts)

-- Move to the start/end of current line
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', 'g_', opts)
keymap.set('v', 'H', '^', opts)
keymap.set('v', 'L', 'g_', opts)

-- Git actions
keymap.set('n', '<leader>gm', ':GitMessenger<CR>', opts)

-- Lsp
-- Vtsls
-- Learn more: https://github.com/yioneko/nvim-vtsls/tree/main
keymap.set("n", "<leader>ru", '<CMD>VtsExec remove_unused_imports<CR>', opts)

-- Glance
keymap.set("n", "gi", '<CMD>Glance implementations<CR>', opts)
keymap.set("n", "gd", '<CMD>Glance definitions<CR>', opts)
keymap.set("n", "gr", '<CMD>Glance references<CR>', opts)
keymap.set("n", "gy", '<CMD>Glance type_definitions<CR>', opts)

keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
keymap.set("n", "[d", "<cmd>lua vim.dianostics.goto_next()<CR>")
keymap.set("n", "]d", "<cmd>lua vim.dianostics.goto_prev()<CR>")
-- keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- keymap.set("n", "fa", '<cmd>Lspsaga finder<CR>', opts)
keymap.set("n", "<space>rn", '<cmd>Lspsaga rename<CR>', opts)

keymap.set('n', '<C-e>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')

-- Clean highlight search
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', ';', ':', opts)

-- Jump to the start/last of the still inside the insert mode
keymap.set('i', '<c-l>', '<C-o>A')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Close all buffers
vim.api.nvim_set_keymap('n', '<C-w><C-k>', ':bufdo :bd<CR>', {noremap = true})
-- Close current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', {noremap = true})

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Debugging
-- keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
-- keymap.set('n', '<leader>dc', ':lua require"dap".continue()<CR>')
-- keymap.set('n', '<leader>db', ':lua require"dap".reverse_continue()<CR>')
-- keymap.set('n', '<leader>ds', ':lua require"dap".step_over()<CR>')
-- keymap.set('n', '<leader>di', ':lua require"dap".step_into()<CR>')
-- keymap.set('n', '<leader>do', ':lua require"dap".step_out()<CR>')
-- keymap.set('n', '<leader>dk', ':lua require"dap".up()<CR>')
-- keymap.set('n', '<leader>dj', ':lua require"dap".down()<CR>')
-- keymap.set('n', '<leader>b', ':lua require"dap".toggle_breakpoint()<CR>')
-- keymap.set('n', '<leader>dt', ':lua require("dap-go").debug_test()<CR>')
-- keymap.set('n', '<leader>dui', ':lua require("dapui").open()<CR>')
-- keymap.set('n', '<leader>duic', ':lua require("dapui").close()<CR>')

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

keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<Return>')
keymap.set('n', '<Tab>', ':BufferLineCycleNext<Return>')
-- keymap.set('n', '<S-Tab>', ':BufferPrevious<Return>')
-- keymap.set('n', '<Tab>', ':BufferNext<Return>')

vim.opt.clipboard:append{'unnamedplus'}
