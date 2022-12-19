lua << EOF

-- Lua:
-- For dark theme (neovim's default)
-- vim.o.background = 'dark'
-- For light theme
-- vim.o.background = 'light'

local c = require('vscode.colors')
require('vscode').setup({
    -- Enable transparent background
    transparent = false,

    -- Enable italic comment
    italic_comments = true,

    -- Disable nvim-tree background color
    -- disable_nvimtree_bg = true,

    -- Override colors (see ./lua/vscode/colors.lua)
    color_overrides = {
        vscLineNumber = '#FFFFFF',

        -- My cozy colors :)

        vscGray = '#808080',
        vscViolet = '#646695',
        vscBlue = '#569CD6',
        vscDarkBlue = '#223E55',
        vscMediumBlue = '#18a2fe',
        -- vscLightBlue = '#9CDCFE',
        -- lighblue become the light orange
        vscLightBlue = '#CE9178',
        vscBlueGreen = '#CE9178',
        vscGreen = '#6A9955',
        vscLightGreen = '#B5CEA8',
        vscRed = '#F44747',
        vscOrange = '#CE9178',
        vscLightRed = '#D16969',
        -- vscYellowOrange = '#ffffff',
        vscrightscYellow = '#ffffff',
        -- vscPink = '#C586C0',
        -- pink become the light blue
        vscPink = '#569CD6',
    },

    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
    }
})

EOF
