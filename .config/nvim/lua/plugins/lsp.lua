return function()
  local nvim_lsp = require('lspconfig')
  local protocol = require('vim.lsp.protocol')
  
  local another_on_attach = function(client, bufnr)
    -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings.
    local opts = { noremap = true, silent = true }
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>oi', ':lua require("jdtls").organize_imports()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    -- Config with nvim nightly
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_command [[augroup Format]]
    --   vim.api.nvim_command [[autocmd! * <buffer>]]
    --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    --   vim.api.nvim_command [[augroup END]]
    -- end

    -- Format on save (just for java and jsp)
    -- if client.resolved_capabilities.document_formatting then
    if client.server_capabilities.document_formatting then
      vim.api.nvim_command [[augroup Format]]
      vim.api.nvim_command [[autocmd! * <buffer>]]
      vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
      vim.api.nvim_command [[augroup END]]
    end
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
    buf_set_keymap('n', '<space>oi', ':lua require("jdtls").organize_imports()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)

    -- Config with nvim nightly
    -- if client.server_capabilities.documentFormattingProvider then
    --   vim.api.nvim_command [[augroup Format]]
    --   vim.api.nvim_command [[autocmd! * <buffer>]]
    --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    --   vim.api.nvim_command [[augroup END]]
    -- end

    -- Format on save (just for java and jsp)
    -- if client.resolved_capabilities.document_formatting then
    -- if client.server_capabilities.document_formatting then
    --   vim.api.nvim_command [[augroup Format]]
    --   vim.api.nvim_command [[autocmd! * <buffer>]]
    --   vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    --   vim.api.nvim_command [[augroup END]]
    -- end
  end

  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  nvim_lsp.cssls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "css", "scss" }
  }

  nvim_lsp.lua_ls.setup {
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

  -- Dart
  -- Cmd for install: brew tap dart-lang/dart
  -- And: brew install dart
  nvim_lsp.dartls.setup {
    on_attach = on_attach,
  }

  -- nvim_lsp.gopls.setup {
  --   capabilities = capabilities,
  --   on_attach = on_attach,
  --   settings = {
  --       gopls = {
  --           gofumpt = true,
  --       },
  --   },
  --   flags = {
  --       debounce_text_changes = 150,
  --   },
  -- }

  -- npm install -g @prisma/language-server
  require 'lspconfig'.prismals.setup {
    on_attach = on_attach,
    capabilities = capabilities
  }

  -- Setup html
  nvim_lsp.html.setup {
    on_attach = on_attach,
    filetypes = { "html", "jsp", "ejs" },
    capabilities = capabilities,
  }
  -- Setup html

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

  -- Php
  -- nvim_lsp.intelephense.setup{
  --     capabilities = capabilities,
  --     on_attach = on_attach,
  -- }

  nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }

  -- nvim_lsp.pyright.setup {
  --  on_attach = on_attach,
  --  capability = capabilities
  -- }

  -- Bash
  -- brew install shellcheck -> for linting(diagnostics)
  nvim_lsp.bashls.setup {
    on_attach = on_attach,
  }

  -- Golang
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

  -- Devops
  -- Docker compose
  nvim_lsp.yamlls.setup {
    on_attach = on_attach,
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
          ["../path/relative/to/file.yml"] = "/.github/workflows/*",
          ["/path/from/root/of/project"] = "/.github/workflows/*",
        },
      },
    }
  }

  -- Dockerfile
  nvim_lsp.dockerls.setup {
    on_attach = on_attach,
  }

  -- ,cmd = { 'jdtls' }
  nvim_lsp.jdtls.setup {
    on_attach = on_attach,
    cmd = { 'jdtls' }
  }

  nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx", "typescript.jsx", "javascript", "javascriptreact" },
  }

  -- nvim_lsp.sourcekit.setup {
  --   on_attach = on_attach,
  -- }

  -- Diagnostic symbols in the sign column (gutter)
  local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
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

  vim.keymap.set('n', '<leader>o', '<cmd>TypescriptOrganizeImports<cr>')
  vim.keymap.set('n', '<leader>a', '<cmd>TypescriptAddMissingImports<cr>')
end
