return function()
  local dap = require('dap')

  -- dap.adapters["pwa-node"] = {
  --   type = "server",
  --   host = "127.0.0.1",
  --   -- port = "${port}", --let both ports be the same for now...
  --   port = 3000, --let both ports be the same for now...
  --   executable = {
  --     -- command = "node",
  --     -- -- 💀 Make sure to update this path to point to your installation
  --     -- args = { vim.fn.stdpath('data') .. "Users/thangphan/.local/share/nvim/mason/packages/js-debug-adapter/dapDebugServer.js", "${port}" },
  --     command = "js-debug-adapter",
  --     -- args = { "${port}" },
  --   },
  -- }

  dap.adapters.node2 = {
     type = 'executable';
     command = 'node',
     args = { vim.fn.stdpath("data") .. '/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' };
     -- args = { vim.fn.stdpath('data') .. "Users/thangphan/.local/share/nvim/mason/packages/js-debug-adapter/dapDebugServer.js", "${port}" },
  }

  dap.configurations = {
    javascript = {
      {
        type = 'node2';
        name = 'Launch',
        request = 'launch';
        program = '${file}';
        cwd = vim.fn.getcwd();
        sourceMaps = true;
        protocol = 'inspector';
        console = 'integratedTerminal';
      },
      {
        type = 'node2';
        name = 'Attach',
        request = 'attach';
        program = '${file}';
        cwd = vim.fn.getcwd();
        sourceMaps = true;
        protocol = 'inspector';
        console = 'integratedTerminal';
      },
    }
}

  -- for _, language in ipairs({ "typescript", "javascript" }) do
  --   dap.configurations[language] = {
  --     {
  --       type = 'pwa-node',
  --       request = 'launch',
  --       name = 'Launch Current File (pwa-node)',
  --       program = "${file}",
  --       cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
  --       runtimeExecutable = "node",
  --     }
  --     -- {
  --     --   type = 'pwa-node',
  --     --   request = 'launch',
  --     --   name = 'Launch Current File (pwa-node)',
  --     --   cwd = "${workspaceFolder}", -- vim.fn.getcwd(),
  --     --   args = { '${file}' },
  --     --   sourceMaps = true,
  --     --   protocol = 'inspector',
  --     -- },
  --     -- {
  --     --   type = 'pwa-node',
  --     --   request = 'launch',
  --     --   name = 'Launch Current File (Typescript)',
  --     --   cwd = "${workspaceFolder}",
  --     --   runtimeArgs = { '--loader=ts-node/esm' },
  --     --   program = "${file}",
  --     --   runtimeExecutable = 'node',
  --     --   -- args = { '${file}' },
  --     --   sourceMaps = true,
  --     --   protocol = 'inspector',
  --     --   outFiles = { "${workspaceFolder}/**/**/*", "!**/node_modules/**" },
  --     --   skipFiles = { '<node_internals>/**', 'node_modules/**' },
  --     --   resolveSourceMapLocations = {
  --     --     "${workspaceFolder}/**",
  --     --     "!**/node_modules/**",
  --     --   },
  --     -- },
  --   }
  -- end

end
