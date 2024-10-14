return function()
    local nvim_lsp = require('lspconfig')

    local border = {
        {"╭", 'FloatBorder'}, {"─", 'FloatBorder'}, {"╮", 'FloatBorder'},
        {"│", 'FloatBorder'}, {"╯", 'FloatBorder'}, {"─", 'FloatBorder'},
        {"╰", 'FloatBorder'}, {"│", 'FloatBorder'}
    }

    local handlers = {
        ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover,
                                              {border = border}),
        ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers
                                                          .signature_help,
                                                      {border = border})
    }

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(_, bufnr)
        -- require "lsp_signature".on_attach()  -- Note: add in lsp client on-attach

        -- require("twoslash-queries").attach(client, bufnr)
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
        end

        -- Mappings.
        local opts = {noremap = true, silent = true}
    end

    -- Enable (broadcasting) snippet capability for completion
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    nvim_lsp.cssls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = {"css", "scss"}
    }

    nvim_lsp.jdtls.setup {on_attach = on_attach, capabilities = capabilities}

    nvim_lsp.lua_ls.setup {
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {'vim'},
                    disable = {'trailing-space'}
                },

                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    checkThirdParty = false
                }
            }
        }
    }

    -- Dart
    -- Cmd for install: brew tap dart-lang/dart
    -- And: brew install dart
    nvim_lsp.dartls.setup {on_attach = on_attach}

    nvim_lsp.clangd.setup {on_attach = on_attach}

    nvim_lsp.html.setup {
        on_attach = on_attach,
        filetypes = {"html", "jsp", "ejs", "eruby"},
        capabilities = capabilities
    }

    -- nvim_lsp.tailwindcss.setup {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- }

    nvim_lsp.pyright.setup {
        handlers = handlers,
        on_attach = on_attach,
        capability = capabilities
    }

    -- Bash
    -- brew install shellcheck -> for linting(diagnostics)
    nvim_lsp.bashls.setup {handlers = handlers, on_attach = on_attach}

    -- Golang
    nvim_lsp.gopls.setup {
        on_attach = on_attach,
        handlers = handlers,
        cmd = {"gopls", "serve"},
        settings = {analyses = {unusedparams = true}, staticcheck = true}
    }

    nvim_lsp.terraformls.setup {on_attach = on_attach}

    -- Dockerfile
    nvim_lsp.dockerls.setup {on_attach = on_attach}

    nvim_lsp.eslint.setup({
        on_attach = function(_, bufnr)
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll"
            })
        end
    })

    nvim_lsp.ruby_lsp.setup {
        on_attach = on_attach,
        init_options = {formatter = "auto"}
    }

    nvim_lsp.rubocop.setup {on_attach = on_attach}

    nvim_lsp.apex_ls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        apex_jar_path = vim.fn.expand(
            "$HOME/.local/share/nvim/mason/packages/apex-language-server/extension/dist/apex-jorje-lsp.jar"),
        filetypes = {'cls', 'trigger', 'apex'},
        apex_enable_semantic_errors = false,
        apex_enable_completion_statistics = false
    }

    nvim_lsp.vtsls.setup({handlers = handlers, on_attach = on_attach})

    -- Diagnostic symbols in the sign column (gutter)
    local icons = require("thangphan.config.ui.icons").diagnostics
    local signs = {
        Error = icons.ERROR,
        Warn = icons.WARNING,
        Hint = icons.HINT,
        Info = icons.INFO
    }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
    end

    -- Hanle disappear the lspconfig when using the insertmode
    vim.lsp.handlers["textDocument/publishDiagnostics"] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            update_in_insert = true,
            -- This sets the spacing and the prefix, obviously.
            -- virtual_text = false
            virtual_text = {spacing = 4, prefix = '●'}
        })
end
