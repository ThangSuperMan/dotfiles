return function()
    local cmd = vim.cmd
    cmd("syntax on")
    cmd("set termguicolors")
    -- cmd("colorscheme catppuccin-latte")
    cmd("colorscheme everforest")
    -- cmd("colorscheme rose-pine")
    -- cmd("colorscheme material")
    -- require('material.functions').change_style("deep ocean")

    -- everforest theme
    vim.g.everforest_diagnostic_line_highlight = 1
    vim.g.everforest_background = "soft"
    vim.g.everforest_disable_italic_comment = 0
    vim.g.everforest_transparent_background = 1

    vim.api.nvim_set_hl(0, "TelescopeBorder", {fg = "#7293B3"})
    vim.api.nvim_set_hl(0, "FloatBorder", {fg = "#7293B3"})

    cmd("set background=dark")
    -- cmd("set background=light")
end
