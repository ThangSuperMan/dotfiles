set completeopt=menu,menuone,noselect

lua << EOF

  local nvim_lsp = require('lspconfig')
  local protocol = require('vim.lsp.protocol')

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local another_on_attach = function(client, bufnr)
      -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
      
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Mappings.
      local opts = { noremap = true, silent = true }
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

      -- Format on save
      -- if client.resolved_capabilities.document_formatting then
      --  vim.api.nvim_command [[augroup Format]]
      --  vim.api.nvim_command [[autocmd! * <buffer>]]
      --  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      --  vim.api.nvim_command [[augroup END]]
      -- end
 end

  -- Use an on_attach function to only map the following keys
  -- after the language server attaches to the current buffer
  local on_attach = function(client, bufnr)
      -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach
      
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      -- Mappings.
      local opts = { noremap = true, silent = true }
      buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
      buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
      buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

      -- Config with nvim nightly
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
      end

      -- Format on save
      -- if client.resolved_capabilities.document_formatting then
      --  vim.api.nvim_command [[augroup Format]]
      --  vim.api.nvim_command [[autocmd! * <buffer>]]
      --  vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
      --  vim.api.nvim_command [[augroup END]]
      -- end
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

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

-- npm install -g @prisma/language-server
require'lspconfig'.prismals.setup{
  on_attach = on_attach,
  capabilities = capabilities 
}

-- Setup html
require'lspconfig'.html.setup {
      on_attach= on_attach,
      filetypes = { "html", "jsp", "ejs" },
      capabilities = capabilities,
}
-- Setup html

-- SQL

-- Requires to install some library
-- go get github.com/lighttiger2505/sqls

local dbName = 'notes'

require'lspconfig'.sqls.setup{
  on_attach = another_on_attach,
  capability = capability,
  settings = {
    sqls = {
      connections = {
        {
          driver = 'mysql',
          -- Structure: dbUser:dbPasword@tcp(localhost:dbPort)/dbName
          dataSourceName = 'root:chaungoanbacho@tcp(localhost:3306)/' .. dbName,
        },
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
        },
      },
    },
  },
}

-- SQL

-- Error handling for solidity to slow
require 'lspconfig'.solang.setup {}

-- Solidity
-- cmd: sudo npm install -g solidity-language-server
local lspconfig = require 'lspconfig'
nvim_lsp.solidity_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  default_config = {
    cmd = { 'solidity-ls', '--stdio' },
    filetypes = { 'solidity' },
    root_dir = lspconfig.util.root_pattern('package.json', '.git'),
  },
}

-- Ruby
require'lspconfig'.solargraph.setup{
    on_attach = on_attach,
}

-- Php
require'lspconfig'.intelephense.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Angular
require'lspconfig'.angularls.setup{
    capabilities = capabilities,
    on_attach = on_attach,
}

 nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "typescript",  "typescriptreact", "typescript.tsx", "typescript.jsx",  "javascript" },
}

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

      -- Hanle disappear the lspconfig when using the insertmode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
          update_in_insert = true,
          -- This sets the spacing and the prefix, obviously.
          virtual_text = {
             spacing = 4,
          	-- prefix = '',
          	 prefix = '●'
          }
      }
    )

EOF
