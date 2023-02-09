return function()
    require('dapui').setup({
    layouts = {
        {
          elements = {
          -- Elements can be strings or table with id and size keys.
            "breakpoints",
            { id = "scopes", size = 0.25 },
            "stacks",
            "watches",
          },
          size = 60, -- 40 columns
          position = "left",
        },
        {
          elements = {
            "repl",
          },
          size = 0.25, -- 25% of total lines
          position = "bottom",
        },
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Can be integer or nil.
      }
    })
end
