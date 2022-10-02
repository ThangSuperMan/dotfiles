lua << EOF
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).

    local function on_attach(client, bufnr)
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
      if client.server_capabilities.documentFormattingProvider then
         vim.api.nvim_command [[augroup Format]]
         vim.api.nvim_command [[autocmd! * <buffer>]]
         vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
         vim.api.nvim_command [[augroup END]]
      end
  end

 -- Include the servers you want to have installed by default below
local servers = {
  "vuels",
  "tailwindcss",
}

      -- Hanle disappear the lspconfig when using the insertmode
      vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, {
          update_in_insert = false,
          -- This sets the spacing and the prefix, obviously.
          virtual_text = {
             spacing = 4,
            -- prefix = 'ÔÅ¨ '
          	 -- prefix = 'ÔÜ≤'
          }
      }
    )


for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local default_opts = {
    on_attach = on_attach,
  }

  server:setup(default_opts)
end)

EOF
