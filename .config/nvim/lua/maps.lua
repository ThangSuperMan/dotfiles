local keymap = vim.keymap
local opts = { noremap = true }

-- Set leader key
vim.g.mapleader = ' '
keymap.set('n', 'x', '"_x')

-- Use shift + arrow to resize windows
keymap.set('n', '<S-Up>', '<M-j> :resize -5<CR>', { noremap = true })
keymap.set('n', '<S-Down>', '<M-k> :resize +5<CR>', { noremap = true })
keymap.set('n', '<S-Left>', '<M-h> :vertical resize -5<CR>', { noremap = true })
keymap.set('n', '<S-Right>', '<M-l> :vertical resize +5<CR>', { noremap = true })

-- Float terminal
vim.g.floaterm_keymap_toggle = '<C-\\>'

-- ESC with kj or jk
-- keymap.set('i', 'kj', '<esc>', { noremap = true, silent = true })
keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Codium (My AI assistant)
-- vim.g.codium_disable_keymaps = true
-- keymap.set('i', '<c-;>', function() return vim.fn['codium#CycleCompletions'](1) end, { expr = true })
-- keymap.set('i', '<c-,>', function() return vim.fn['codium#CycleCompletions'](-1) end, { expr = true })
-- keymap.set('i', '<c-x>', function() return vim.fn['codium#Clear']() end, { expr = true })
-- keymap.set('i', '<c-cr>', function() return vim.fn['codium#Accept']() end, { expr = true })

-- Window navigation
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true })

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

-- ESC with kj or jk
-- keymap.set('i', 'kj', '<esc>', { noremap = true, silent = true })
keymap.set('i', 'jk', '<esc>', { noremap = true, silent = true })

-- Ctrl-s to save
keymap.set('n', '<C-s>', ':w!<CR>', { noremap = true })
-- keymap.set('i', 'ww', '<ESC>:w!<CR>', { noremap = true })

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- turn spelling off or on
keymap.set('n', ',s', ':setlocal spell!<Cr>', opts)

-- Commentary
-- keymap.set('n', '<leader>/', ':Commentary<Cr>', opts)
-- keymap.set('v', '<leader>/', ':Commentary<Cr>', opts)

-- Move to the start/end of current line
keymap.set('n', 'H', '^', opts)
keymap.set('n', 'L', 'g_', opts)
keymap.set('v', 'H', '^', opts)
keymap.set('v', 'L', 'g_', opts)

-- Lsp
-- Diagnostic jump can use `<c-o>` to jump back
keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
keymap.set("n", "<leader>oi", '<cmd>lua require("jdtls").organize_imports()<CR>')
-- keymap.set("n", "gd", '<cmd>lua require("jdtls").organize_imports()<CR>', opts)
keymap.set("n", "gd", '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)

-- Float terminal
keymap.set('n', '<C-e>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')

-- Clean highlight search
keymap.set('n', '<Esc><Esc>', ':nohlsearch<CR>', opts)

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

keymap.set('n', ';', ':', opts)

-- Jump to the last of the still inside the insert mode
keymap.set('i', '<c-l>', '<C-o>A')

-- New tab
keymap.set('n', 'te', ':tabedit')

-- Close all buffers
vim.api.nvim_set_keymap('n', '<C-w><C-k>', ':bufdo :bd<CR>', { noremap = true })
-- Close current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { noremap = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
-- keymap.set('', 'sh', '<C-w>h')
-- keymap.set('', 'sk', '<C-w>k')
-- keymap.set('', 'sj', '<C-w>j')
-- keymap.set('', 'sl', '<C-w>l')

-- Scroll setup
-- keymap.set('n', '<C-d>', '10<C-d>')
-- keymap.set('n', '<C-u>', '10<C-u>')

-- Debugging
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

keymap.set('n', '<S-Tab>', ':BufferPrevious<Return>')
keymap.set('n', '<Tab>', ':BufferNext<Return>')

vim.opt.clipboard:append { 'unnamedplus' }

local wk = require("which-key")

wk.register({
    ["<leader>h"] = {
    name = "hop around",
    b = { [[<Cmd>lua require'hop'.hint_char2()<CR>]], "Hop to bigram (two characters)" },
    c = { [[<Cmd>lua require'hop'.hint_char1()<CR>]], "Hop to character" },
    l = { [[<Cmd>lua require'hop'.hint_lines()<CR>]], "Hop to line" },
    t = { [[<Cmd>lua require'hop'.hint_patterns()<CR>]], "Hop to pattern" },
    w = { [[<Cmd>lua require'hop'.hint_words()<CR>]], "Hop to word" },
  },
   ["<leader>t"] = {
    name = "+terminal",
    k = { [[<Cmd>lua _K9S_TOGGLE()<CR>]], "k9s" },
    h = { [[<Cmd>lua _HTOP_TOGGLE()<CR>]], "htop" },
    l = { [[<Cmd>lua _LAZYGIT_TOGGLE()<CR>]], "lazygit" },
    -- t = { [[<Cmd>ToggleTerm<CR>]], "terminal" },
    q = { [[<Cmd>GoTermClose<CR>]], "go term close" },
  },
   ["<leader>n"] = {
    name = "npm packages",
    s = { [[<Cmd>lua require("package-info").show()<CR>]], "show" },
    c = { [[<Cmd>lua require("package-info").hide()<CR>]], "close" },
  },
  ["<leader>i"] = {
    name = "+insert",
    d = { [[i<C-R>=strftime('%Y-%m-%d')<CR><Esc>]], "Insert Current Time" },
  },
})
