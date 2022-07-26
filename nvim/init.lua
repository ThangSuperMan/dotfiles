local opt = vim.opt

require('plugins')

-- Funtionality
vim.cmd [[ augroup highlight_yank]]
vim.cmd [[ autocmd!]]
vim.cmd [[ autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = "Substitute", timeout = 100})]]
vim.cmd [[ augroup END]]

-- vim.bo.expandtab = true
opt.tabstop = 2
vim.bo.shiftwidth = 2
vim.bo.softtabstop = 2

-- Colorscheme
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.opt.background = 'dark'
vim.cmd 'colorscheme everforest'

opt.list = true
opt.termguicolors = true
opt.ignorecase = true
opt.smartcase = true
opt.termguicolors = true
opt.number = true
opt.relativenumber = true
-- opt.cursorline = true
opt.smarttab = true
vim.cmd('set listchars=tab:>-,space:·')
vim.cmd('set scrolloff=8')
vim.cmd('set completeopt=menu,menuone,noselect')
vim.cmd('set formatoptions-=cro')
vim.cmd('set mouse=a')
-- Faster completion
vim.cmd('set updatetime=300')
vim.cmd('set timeoutlen=500')
vim.cmd('set fileencoding=utf-8')
vim.cmd('set encoding=utf-8')
vim.cmd('set nowrap')
vim.cmd('set nowb')
vim.cmd('set noswapfile')
vim.cmd('set nobackup')
vim.cmd('set path+=**')

opt.clipboard = "unnamed"

local keymap = vim.api.nvim_set_keymap 

-- Moving betweens windows
-- keymap('n', 'sh', '<C-w>h', {})
-- keymap('n', 'sk', '<C-w>k', {})
-- keymap('n', 'sj', '<C-w>j', {})
-- keymap('n', 'sl', '<C-w>l', {})

local opts = { noremap = true }

-- Split windows
keymap('n', 'ss', ':split<Return><C-w>w', opts)
keymap('n', 'sv', ':vsplit<Return><C-w>w', opts)

-- Turn off the highlight on search
keymap('n', '<Esc><Esc>', ':set nohlsearch<CR>', opts)
  
keymap('n', '<S-t>', ':NvimTreeToggle<CR>', opts)

-- Move to the start/end of current line
keymap('n', 'H', '^', opts)
keymap('n', 'L', 'g_', opts)
keymap('v', 'H', '^', opts)
keymap('v', 'L', 'g_', opts)

-- Ctrl-s to save
keymap('n', '<C-s>', ':w!<CR>', opts)
keymap('i', 'ww', '<ESC>:w!<CR>', opts)

-- Window navigation
keymap('n', '<C-h>', ':wincmd h<CR>', opts)
keymap('n', '<C-j>', ':wincmd j<CR>', opts)
keymap('n', '<C-k>', ':wincmd k<CR>', opts)
keymap('n', '<C-l>', ':wincmd l<CR>', opts)

-- ESC with kj or jk
vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<esc>', { noremap = true, silent = true })

-- nnoremap  <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>
-- nnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>
keymap('n', ',f', "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)
keymap('n', ';r', "<cmd>lua require('telescope.builtin').live_grep()<cr>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Nvim Tree (explore files)
keymap('n', '<C-f>', ':NvimTreeToggle<CR>', opts)

keymap('n', '<leader>h', '<C-w>h', {})
keymap('n', '<leader>l', '<C-w>l', {})

-- Move the selected line
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '>-2<CR>gv=gv", opts)

-- Searching center window for the target thing
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Save some strokes
keymap('n', ';', ':', opts)

-- Yank from the current position to the end of the line
keymap('n', 'Y', 'y$', opts)

-- Tabs
keymap('n', 'te', ':tabedit', opts)
keymap('n', '<S-Tab>', ':tabprev<Return>', opts)
keymap('n', '<Tab>', ':tabnext<Return>', opts)

-- Plugins require

-- Buffertag
require('buffertag').enable()

-- Comment
require('Comment').setup()

-- Lualine
-- require('lualine').setup {
--   options = {
--     theme = 'everforest'
--   }
-- }

local status, lualine = pcall(require, "lualine")
if (not status) then return end

  local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local location = {
  "location",
  padding = 0,
}

local mode = {
  "mode",
  fmt = function(str)
      -- return "-- " .. str .. " --"
      return str
  end,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "info" },
	symbols = { error = " ", info = " " },
	colored = true,
	update_in_insert = false,
	always_visible = true,
}

lualine.setup {
  options = {
    icons_enabled = true,
		 theme= 'everforest',
       section_separators = {left = '', right = ''},
       component_separators = {left = '', right = ''},

    disabled_filetypes = {}
},
  sections = {
    lualine_a = {mode
    },
    lualine_b = {
        branch,
        diagnostics,
    },
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
      hide_in_width,
    }},

    lualine_x = {
         -- { 'diagnostics', sources = {"nvim_diagnostic"},
         -- symbols = {error = ' ', warn = ' ', info = ' ', warn = ' '} },
         -- symbols = {error = ' ', warn = ' ', info = ' ', warn = ' '} },
      'encoding',
      'filetype',
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
tabline = {
  },
  extensions = {}
}


-- Toggle terminal 
local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	size = 20,
	open_mapping = [[<c-\>]],
	hide_numbers = true,
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
	},
})

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  -- vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

function _LAZYGIT_TOGGLE()
	lazygit:toggle()
end

-- File explore 
-- OR setup with some options

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  renderer = {
    root_folder_modifier = ":t",
    icons = {
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_open = "",
          arrow_closed = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          untracked = "U",
          deleted = "",
          ignored = "◌",
        },
      },
    },
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    height = 30,
    side = "left",
    mappings = {
      list = {
        { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
        { key = "h", cb = tree_cb "close_node" },
        { key = "v", cb = tree_cb "vsplit" },
      },
    },
  },
}

keymap('n', ',t', ':NvimTreeToggle<CR>', { noremap = true })

-- Saga 
local saga = require "lspsaga"

keymap('n', '<C-j>', "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
keymap('n', 'gh', "<Cmd>Lspsaga lsp_finder<CR>", opts)
keymap('n', 'gp', "<Cmd>Lspsaga preview_definition<CR>", opts)

-- Treesitter
require'nvim-treesitter.configs'.setup {
	highlight = {
    enable = true,
    disable = {},
  },
	indent = {
    enable = false,
    disable = {},
  },
 ensure_installed = {
    "javascript",
    "go",
   	"tsx",
    "html",
    "ruby",
    "lua",
  },
  autotag = {
    enable = true,
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Auto close tag tsx
require('nvim-ts-autotag').setup()

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      -- For `vsnip` user.
      -- vim.fn["vsnip#anonymous"](args.body)

      -- For `luasnip` user.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` user.
      -- vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = {
    { name = 'nvim_lsp' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
    -- { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
  }
})

-- Icons for cmp
require('lspkind').init({
    -- DEPRECATED (use mode instead): enables text annotations
    --
    -- default: true
    -- with_text = true,

    -- defines how annotations are shown
    -- default: symbol
    -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
    -- mode = 'symbol_text',
    mode = 'symbol',

    -- default symbol map
    -- can be either 'default' (requires nerd-fonts font) or
    -- 'codicons' for codicon preset (requires vscode-codicons font)
    --
    -- default: 'default'
    preset = 'codicons',

    -- override preset symbols
    --
    -- default: {}
    symbol_map = {
      Text = "",
      Method = "",
      Function = "",
      Constructor = "",
      Field = "ﰠ",
      Variable = "",
      Class = "ﴯ",
      Interface = "",
      Module = "",
      Property = "ﰠ",
      Unit = "塞",
      Value = "",
      Enum = "",
      Keyword = "",
      Snippet = "",
      Color = "",
      File = "",
      Reference = "",
      Folder = "",
      EnumMember = "",
      Constant = "",
      Struct = "פּ",
      Event = "",
      Operator = "",
      TypeParameter = ""
    },
})

local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      before = function (entry, vim_item)
        return vim_item
      end
    })
  }
}

-- Lsp
  nvim_lsp = require('lspconfig')
  protocol = require('vim.lsp.protocol')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
      require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Mappings.
      local opts = { noremap = true, silent = true }
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

      -- Format on save
      if client.resolved_capabilities.document_formatting then
       vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
      end

 end

   --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  nvim_lsp.cssls.setup {
		on_attach = on_attach,
    capabilities = capabilities,
		filetypes = {"css", "scss"}
  }

  nvim_lsp.gopls.setup {
    on_attach = on_attach,
    cmd = { "gopls", "serve" },
    settings = {
      analyses = {
        unusedparams = true
      },
      staticcheck = true
    }
  }

-- Setup html
      require'lspconfig'.html.setup {
            on_attach= on_attach,
            filetypes = { "html", "jsp", "ejs", "gohtml" },
            capabilities = capabilities,
      }
-- Setup html


 nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript",  "typescriptreact", "typescript.tsx", "typescript.jsx",  "javascript" },
}

      -- Hanle disappear the lspconfig when using the insertmode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
          update_in_insert = false,
          -- This sets the spacing and the prefix, obviously.
          virtual_text = {
             spacing = 4,
          }
      }
    )
