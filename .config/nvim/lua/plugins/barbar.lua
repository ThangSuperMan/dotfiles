return function()
    require'barbar'.setup {
        animation = true,
        tabpages = true,
        clickable = true,
        -- icons = "",
        icons = {
        button = "",
        buffer_index = false,
        buffer_number = false,
        active_sep = "",
        inactive_sep = "",
    },
}

    vim.cmd("hi BufferTabpageFill guibg=NONE")
    vim.cmd("hi TabLine guibg=NONE")
end
