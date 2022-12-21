local keymap = vim.keymap
local opts = { noremap = true }

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

-- Lsp saga
-- nnoremap <silent> <C-e> <Cmd>Lspsaga diagnostic_jump_next<CR>
-- nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
-- nnoremap <silent> gp <Cmd>Lspsaga preview_definition<CR>
-- " nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
-- "nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
-- " inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
-- " nnoremap <silent> gr <Cmd>Lspsaga rename<CR>
keymap.set('n', '<C-e>', '<Cmd>Lspsaga diagnostic_jump_next<CR>')
-- keymap.set('n', 'rn', '<Cmd>Lspsaga rename<CR>')
keymap.set('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
-- "nnoremap <silent> K <Cmd>lua require('lspsaga.hover').render_hover_doc()<CR>

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
-- keymap.set('n', '<C-d>', '10<C-d>')
-- keymap.set('n', '<C-u>', '10<C-u>')

-- Use tab with text block
-- vmap <Tab> >gv
-- vmap <S-Tab> <gv
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
