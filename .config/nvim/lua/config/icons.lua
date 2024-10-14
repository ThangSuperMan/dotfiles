local M = {
    diagnostics = {Error = " ", Warn = " ", Hint = " ", Info = " "},
    git = {added = "", changed = "", deleted = ""},
    --- Shared icons that don't really fit into a category.
    misc = {
        bug = ' ',
        ellipsis = '…',
        git = '',
        search = '',
        vertical_bar = '│'
    },
    symbol_kinds = {
        Array = '󰅪',
        Class = '',
        Color = '󰏘',
        Constant = '󰏿',
        Constructor = '',
        Enum = '',
        EnumMember = '',
        Event = '',
        Field = '󰜢',
        File = '󰈙',
        Folder = '',
        Function = '󰆧',
        Interface = '',
        Keyword = '󰌋',
        Method = '󰆧',
        Module = '',
        Operator = '󰆕',
        Property = '󰜢',
        Reference = '󰈇',
        Snippet = '',
        Struct = '',
        Text = '',
        TypeParameter = '',
        Unit = '',
        Value = '',
        Variable = '󰀫'
    }
}

return M
