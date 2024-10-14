return function()

    -- Setup nvim-cmp.
    vim.completeopt = "menu,menuone,noselect,noinsert"

    local function border(hl_name)
        return {
            {"╭", hl_name}, {"─", hl_name}, {"╮", hl_name},
            {"│", hl_name}, {"╯", hl_name}, {"─", hl_name},
            {"╰", hl_name}, {"│", hl_name}
        }
    end

    local cmp_window = require "cmp.utils.window"

    cmp_window.info_ = cmp_window.info
    cmp_window.info = function(self)
        local info = self:info_()
        info.scrollable = false
        return info
    end

    local cmp = require 'cmp'
    -- local lspkind = require 'lspkind'
    -- local luasnip = require('luasnip')
    local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and
                   vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
                       col, col):match("%s") == nil
    end

    cmp.setup({
        window = {
            completion = {
                border = border "CmpMenuBorder",
                winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None"
            },
            documentation = {border = border "CmpDocBorder"}
        },
        snippet = {
            expand = function(args)
                -- luasnip.lsp_expand(args.body)
            end
        },
        formatting = {
            fields = {"kind", "abbr", "menu"},
            format = function(_, item)
                -- local icons = require("lazyvim.config").icons.kinds
                -- local icons = require("thangphan.ui.icons").lsp_kind
                local icons = require("config.icons").symbol_kinds
                if icons[item.kind] then
                    item.kind = icons[item.kind]
                end
                return item
                -- format = require("tailwindcss-colorizer-cmp").formatter,
                -- format = lspkind.cmp_format({
                --   with_text = false,
                --   maxwidth = 50,
                --   menu = {buffer = "[Buf]", nvim_lsp = "[LSP]", dictionary = "[Dict]"}
                -- })
            end
        },
        mapping = cmp.mapping.preset.insert({
            -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
            ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
            ['<CR>'] = cmp.mapping.confirm({select = true}),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                    -- elseif luasnip.expand_or_jumpable() then
                    --  luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, {"i", "s"}),
            ['<S-Tab>'] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                    -- elseif luasnip.jumpable(-1) then
                    --  luasnip.jump(-1)
                else
                    fallback()
                end
            end, {"i", "s"})
        }),
        sources = {
            {name = 'nvim_lsp'}, {name = 'orgmode'},
            -- {name = 'nvim_lsp_signature_help'}, -- For vsnip user.
            -- { name = 'vsnip' },
            -- For luasnip user.
            {name = 'luasnip'}, -- For ultisnips user.
            -- { name = 'ultisnips' },
            {name = 'buffer'}
        }
    })

    -- color documentation border
    -- vim.api.nvim_set_hl(0, "CmpDocBorder", {fg = "#7293B3"})

    -- color menu autocompletion border
    -- vim.api.nvim_set_hl(0, "CmpMenuBorder", {fg = "#7293B3"})

    -- background color item selected in menu autocompletion
    -- vim.api.nvim_set_hl(0, "CmpMenuSel", {bg = "<hexadecimal_color>"})
end
