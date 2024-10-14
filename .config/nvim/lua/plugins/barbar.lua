return function()
    require'barbar'.setup {
        animation = true,
        tabpages = true,
        clickable = true,
        icons = {
        button = "x",
        buffer_index = false,
        buffer_number = false,
        active_sep = '',
        inactive_sep = '',
        separator = {left = '', right = ''},
    },
  }

    vim.cmd("hi BufferTabpageFill guibg=NONE")
    vim.cmd("hi TabLine guibg=NONE")
end
