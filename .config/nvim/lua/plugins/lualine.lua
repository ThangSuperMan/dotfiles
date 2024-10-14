return function()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    -- section_separators = {left = '', right = ''},
    -- component_separators = {left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, sources = {"nvim_diagnostic"}, 'diagnostics' } },
    lualine_c = { { 'filename', path = 1 } },
    lualine_x = {},
    lualine_y = { '' },
    lualine_z = { 'filetype' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {'fugitive'}
}
require('lualine').setup {
  options = {
    icons_enabled = true,
     theme = 'everforest',
    --  theme = 'auto',
    --  theme = 'auto',
    -- theme = 'gruvbox',
    -- theme = 'solarized_dark',
    -- theme = 'powerline',
    section_separators = {left = '', right = ''},
    component_separators = {left = '', right = ''},
     -- section_separators = {left = '', right = ''},
     -- component_separators = {left = '', right = ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    -- lualine_b = {'branch'},
    lualine_c = {
      { symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, sources = {"nvim_diagnostic"}, 'diagnostics' },
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_x = {
      -- { symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '}, sources = {"nvim_diagnostic"}, 'diagnostics' },
      'encoding',
      'filetype'
    },
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      -- 'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    }},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'fugitive'}
}
end

-- return function()
--   require("lualine").setup {
--     options = {
--       icons_enabled = true,
--       theme = 'auto',
--       component_separators = { left = '', right = '' },
--       section_separators = { left = '', right = '' },
--       disabled_filetypes = {
--         statusline = { "dashboard", "lazy", "alpha" },
--         winbar = {},
--       },
--       ignore_focus = {},
--       always_divide_middle = true,
--       globalstatus = false,
--       refresh = {
--         statusline = 1000,
--         tabline = 1000,
--         winbar = 1000,
--       },
--     },
--     sections = {
--       lualine_a = { 'mode' },
--       lualine_b = {
--         {
--           symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
--           sources = { "nvim_diagnostic" },
--           'diagnostics',
--         },
--       },
--       lualine_c = { { 'filename', path = 1 } },
--       lualine_x = {},
--       lualine_y = { '' },
--       lualine_z = { 'filetype' },
--     },
--     inactive_sections = {
--       lualine_a = {},
--       lualine_b = {},
--       lualine_c = { 'filename' },
--       lualine_x = { 'location' },
--       lualine_y = {},
--       lualine_z = {},
--     },
--     tabline = {},
--     winbar = {},
--     inactive_winbar = {},
--     extensions = { 'fugitive' },
--   }
-- end

