return function()
-- Setup nvim-cmp.
vim.completeopt = "menu,menuone,noselect,noinsert"

local function border(hl_name) 
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
      }
end

local cmp_window = require "cmp.utils.window"

cmp_window.info_ = cmp_window.info
cmp_window.info = function(self)
  local info = self:info_()
  info.scrollable = false
  return info
end

local cmp = require'cmp'
local lspkind = require'lspkind'
local luasnip = require('luasnip')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  -- window = {
  --   completion = {
  --     border = border "CmpBorder",
  --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
  --   },
  --   documentation = {
  --     border = border "CmpDocBorder",
  --   },
  -- },
  snippet = {
    expand = function(args)
      -- luasnip.lsp_expand(args.body)
    end,
  },
		formatting = {
			format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
      menu = {buffer = "[Buf]", nvim_lsp = "[LSP]", dictionary = "[Dict]"}
    })
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
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
    end, { "i", "s" }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
     -- elseif luasnip.jumpable(-1) then
     --  luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'orgmode' },
    { name = 'nvim_lsp_signature_help' },

    -- For vsnip user.
    -- { name = 'vsnip' },

    -- For luasnip user.
     { name = 'luasnip' },

    -- For ultisnips user.
    -- { name = 'ultisnips' },

    { name = 'buffer' },
  }
})
end

-- return function()
--   local cmp = require'cmp'
--     local lsp_symbols = {
--         Text = "   (Text) ",
--         Method = "   (Method)",
--         Function = "   (Function)",
--         Constructor = "   (Constructor)",
--         Field = " ﰠ  (Field)",
--         Variable = "[] (Variable)",
--         Class = "   (Class)",
--         Interface = " ﰮ  (Interface)",
--         Module = "   (Module)",
--         Property = " 襁 (Property)",
--         Unit = "   (Unit)",
--         Value = "   (Value)",
--         Enum = " 練 (Enum)",
--         Keyword = "   (Keyword)",
--         -- Snippet = "   (Snippet)",
--         Color = "   (Color)",
--         File = "   (File)",
--         Reference = "   (Reference)",
--         Folder = "   (Folder)",
--         EnumMember = "   (EnumMember)",
--         Constant = " ﲀ  (Constant)",
--         Struct = " ﳤ  (Struct)",
--         Event = "   (Event)",
--         Operator = "   (Operator)",
--         TypeParameter = "   (TypeParameter)"
--     }
--   cmp.setup({
--         sources = {
--             {name = "nvim_lsp"}, {name = "path"}, {name = "buffer"},
--             {name = "ultisnips"}, {name = "crates"},
--             {name = 'nvim_lsp_signature_help'}
--         },
--         snippet = {
--             -- REQUIRED - you must specify a snippet engine
--             expand = function(args)
--                 -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
--                 -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--                 vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
--                 -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
--             end
--         },
--         mapping = {
--             ["<cr>"] = cmp.mapping.confirm({select = true}),
--             ["<s-tab>"] = cmp.mapping.select_prev_item(),
--             ["<tab>"] = cmp.mapping.select_next_item()
--         },
--         formatting = {
--             format = function(entry, item)
--                 item.kind = lsp_symbols[item.kind]
--                 item.menu = ({
--                     buffer = "[Buffer]",
--                     nvim_lsp = "[LSP]",
--                     ultisnips = "[Snippet]",
--                     nvim_lua = "[Lua]",
--                     path = "[Path]"
--                 })[entry.source.name]

--                 return item
--             end
--         }
--     })
-- end
