local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

return require('lazy').setup({
    -- Completion
    {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"},
    {"hrsh7th/cmp-nvim-lsp-signature-help"},
    {"hrsh7th/nvim-cmp", config = require "plugins.cmp"}, {'tpope/vim-rails'},
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = require("plugins.treesitter")
    }, {
        'nvimdev/dashboard-nvim',
        event = 'VimEnter',
        config = function()
            require('dashboard').setup {
                -- config
            }
        end
    }, {
        "kevinhwang91/nvim-ufo",
        enabled = true,
        dependencies = {"kevinhwang91/promise-async"},
        event = "BufRead",
        keys = {
            {"zR", function() require("ufo").openAllFolds() end},
            {"zM", function() require("ufo").closeAllFolds() end}, {
                "K", function()
                    local winid = require("ufo").peekFoldedLinesUnderCursor()
                    if not winid then vim.lsp.buf.hover() end
                end
            }
        },
        config = function()
            vim.o.fillchars =
                [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            vim.o.foldcolumn = "0"
            vim.o.foldlevel = 99
            vim.o.foldlevelstart = 100
            vim.o.foldenable = true
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = (" 󰁂 %d "):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0
                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, {chunkText, hlGroup})
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix ..
                                         (" "):rep(
                                             targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end
                table.insert(newVirtText, {suffix, "MoreMsg"})
                return newVirtText
            end

            require("ufo").setup({
                fold_virt_text_handler = handler,
                close_fold_kinds_for_ft = {
                    default = {"imports", "comment"},
                    json = {"array"},
                    c = {"comment", "region"}
                }
            })
        end
    }, {
        "folke/todo-comments.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        opts = {}
    }, {
        "telescope.nvim",
        dependencies = {
            {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
            "nvim-telescope/telescope-file-browser.nvim"
        },
        enabled = true,
        keys = {
            {
                "sf",
                function()
                    local telescope = require("telescope")

                    local function telescope_buffer_dir()
                        return vim.fn.expand("%:p:h")
                    end

                    telescope.extensions.file_browser.file_browser({
                        path = "%:p:h",
                        cwd = telescope_buffer_dir(),
                        respect_gitignore = false,
                        hidden = true,
                        grouped = true,
                        previewer = false,
                        initial_mode = "normal",
                        layout_config = {height = 40}
                    })
                end,
                desc = "Open File Browser with the path of the current buffer"
            }, {
                "<leader>fP",
                function()
                    require("telescope.builtin").find_files({
                        cwd = require("lazy.core.config").options.root
                    })
                end,
                desc = "Find Plugin File"
            }, {
                ";f",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.find_files({no_ignore = false, hidden = true})
                end,
                desc = "Lists files in your current working directory, respects .gitignore"
            }, {
                ";r",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.live_grep({additional_args = {"--hidden"}})
                end,
                desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore"
            }, {
                ";g",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.git_status()
                end,
                desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore"
            }, {
                "\\\\",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.buffers()
                end,
                desc = "Lists open buffers"
            }, {
                ";;",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.resume()
                end,
                desc = "Resume the previous telescope picker"
            }, {
                ";e",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.diagnostics()
                end,
                desc = "Lists Diagnostics for all open buffers or a specific buffer"
            }, {
                ";s",
                function()
                    local builtin = require("telescope.builtin")
                    builtin.treesitter()
                end,
                desc = "Lists Function names, variables, from Treesitter"
            }
        },
        config = function(_, opts)
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local fb_actions = require("telescope").extensions.file_browser
                                   .actions
            opts.defaults = {
                layout_strategy = "horizontal",
                layout_config = {prompt_position = "top"},
                sorting_strategy = "ascending",
                winblend = 0,
                mappings = {n = {}}
            }
            opts.pickers = {
                diagnostics = {
                    theme = "ivy",
                    initial_mode = "normal",
                    layout_config = {preview_cutoff = 9999}
                }
            }
            opts.extensions = {
                file_browser = {
                    theme = "dropdown",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                    mappings = {
                        -- your custom insert mode mappings
                        ["n"] = {
                            -- your custom normal mode mappings
                            ["N"] = fb_actions.create,
                            ["y"] = fb_actions.copy,
                            ["h"] = fb_actions.goto_parent_dir,
                            ["r"] = fb_actions.rename,
                            ["m"] = fb_actions.move,
                            ["/"] = function()
                                vim.cmd("startinsert")
                            end,
                            ["<C-u>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_previous(prompt_bufnr)
                                end
                            end,
                            ["<C-d>"] = function(prompt_bufnr)
                                for i = 1, 10 do
                                    actions.move_selection_next(prompt_bufnr)
                                end
                            end,
                            ["<PageUp>"] = actions.preview_scrolling_up,
                            ["<PageDown>"] = actions.preview_scrolling_down
                        }
                    }
                }
            }
            telescope.setup(opts)
            require("telescope").load_extension("fzf")
            require("telescope").load_extension("file_browser")
        end
    }, {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        opts = function()
            -- local icons = require("config.icons")

            --- @type Gitsigns.Config
            local C = {
                signs = {
                    add = {text = ""},
                    change = {text = ""},
                    delete = {text = ""},
                    topdelete = {text = ""},
                    changedelete = {text = ""},
                    untracked = {text = ""}
                },
                on_attach = function(buffer)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, desc)
                        vim.keymap.set(mode, l, r,
                                       {buffer = buffer, desc = desc})
                    end

                    map({"n", "v"}, "<leader>gg", ":Gitsigns stage_hunk<CR>",
                        "Stage Hunk")
                    map({"n", "v"}, "<leader>gx", ":Gitsigns reset_hunk<CR>",
                        "Reset Hunk")
                    map("n", "<leader>gp", gs.preview_hunk, "Stage Buffer")
                    map("n", "<leader>gn", gs.next_hunk, "Stage Buffer")
                    map("n", "<leader>gG", gs.stage_buffer, "Stage Buffer")
                    map("n", "<leader>gh", gs.preview_hunk, "Preview Hunk")
                    map("n", "<leader>gu", gs.undo_stage_hunk, "Undo Stage Hunk")
                    map("n", "<leader>gX", gs.reset_buffer, "Reset Buffer")
                    map("n", "<leader>gp", gs.preview_hunk, "Preview Hunk")
                    map("n", "<leader>gb",
                        function()
                        gs.blame_line({full = true})
                    end, "Blame Line")
                    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>",
                        "GitSigns Select Hunk")
                end
            }
            return C
        end,
        keys = {
            -- git hunk navigation - previous / next
            {"gh", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk"},
            {"gH", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk"},
            {"]g", ":Gitsigns next_hunk<CR>", desc = "Goto next git hunk"},
            {"[g", ":Gitsigns prev_hunk<CR>", desc = "Goto previous git hunk"}
        }
    }, -- {
    --   "iamcco/markdown-preview.nvim",
    --   config = function()
    --     vim.fn["mkdp#util#install"]()
    --   end,
    -- },
    {'tpope/vim-surround'}, {
        'windwp/nvim-ts-autotag',
        config = function()
            require('nvim-ts-autotag').setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                }
            })
        end
    }, {'alvan/vim-closetag', config = require 'plugins.closetag'},
    {'jiangmiao/auto-pairs'}, {'terryma/vim-multiple-cursors'}, -- Comment
    {'tpope/vim-commentary'}, -- Snippet
    {'LazyVim/LazyVim'}, {'L3MON4D3/LuaSnip'},
    {'saadparwaiz1/cmp_luasnip', config = require 'plugins.luasnip'}, {
        "windwp/nvim-spectre",
        keys = {
            {
                "<leader>sr",
                function() require("spectre").open() end,
                desc = "Replace in files (Spectre)"
            }
        }
    }, -- { 'psliwka/vim-smoothie' },
    -- {"sainnhe/everforest", config = require("plugins.theme")},
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = "nvim-tree/nvim-web-devicons",
        lazy = false,
        after = "catppuccin",
        config = function()
            local mocha = require("catppuccin.palettes").get_palette "mocha"
            require("bufferline").setup {
                highlights = require("catppuccin.groups.integrations.bufferline").get {
                    styles = {"italic", "bold"}
                }
            }
        end
    }, {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                -- latte / mocha / frappe /macchiato
                flavour = "frappe",
                background = { -- :h background
                    light = "latte",
                    dark = "macchiato"
                },
                transparent_background = true,
                no_italic = false, -- Force no italic
                no_bold = false, -- Force no bold
                no_underline = false, -- Force no underline
                integrations = {
                    hop = false,
                    lsp_saga = false,
                    indent_blankline = {
                        enabled = true,
                        scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
                        colored_indent_levels = false
                    },
                    telescope = {enabled = true},
                    treesitter = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = {"italic"},
                            hints = {"italic"},
                            warnings = {"italic"},
                            information = {"italic"},
                            ok = {"italic"}
                        },
                        underlines = {
                            errors = {"underline"},
                            hints = {"underline"},
                            warnings = {"underline"},
                            information = {"underline"},
                            ok = {"underline"}
                        },
                        inlay_hints = {background = true}
                    }
                }
            }
            vim.cmd.colorscheme "catppuccin"
        end
    }, {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = {"BufReadPre", "BufNewFile"},
        opts = {
            enabled = true,
            exclude = {filetypes = {"help", "Trouble", "lazy"}},
            scope = {
                highlight = {
                    "RainbowDelimiterRed", "RainbowDelimiterYellow",
                    "RainbowDelimiterBlue", "RainbowDelimiterOrange",
                    "RainbowDelimiterGreen", "RainbowDelimiterViolet",
                    "RainbowDelimiterCyan"
                }
            }
        }
    }, -- {"marko-cerovac/material.nvim", config = require("plugins.theme")},
    {'ryanoasis/vim-devicons'}, {
        'kyazdani42/nvim-web-devicons',
        config = function()
            require('nvim-web-devicons').setup {
                override = {
                    rb = {
                        icon = "",
                        color = "#ea76cb",
                        cterm_color = "65",
                        name = "Ruby"
                    }

                },
                default = false,
                color_icons = true
            }
        end
    }, {
        -- "nvim-neo-tree/neo-tree.nvim",
        -- branch = "v2.x",
        -- dependencies = {"nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
        -- config = require("plugins.neotree")
    }, {
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup({keys = "etovxqpdygfblzhckisuran"})
            vim.keymap.set("n", "<leader>hl",
                           "<cmd>lua require'hop'.hint_lines()<cr>")
        end
    }, {
        "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup({
                default_mappings = true,
                mappings = {i = {j = {k = "<Esc>"}}},
                timeout = 200
            })
        end
    }, {'folke/which-key.nvim', config = require 'plugins.which-key'},

    -- Barbar, bufferline
    -- {"b0o/incline.nvim", enabled = true, config = require 'plugins.incline'},
    -- {'romgrk/barbar.nvim', config = require 'plugins.barbar'},
    -- {'akinsho/nvim-bufferline.lua', config = require 'plugins.bufferline'},
    -- {
    --       "nvim-lualine/lualine.nvim",
    --       enabled = false,
    --       event = "VeryLazy",
    --       opts = function(plugin)
    --           if plugin.override then
    --               require("lazyvim.util").deprecate("lualine.override",
    --                                                 "lualine.opts")
    --           end

    --           local icons = require("config.icons")

    --           local diagnostics = {
    --               "diagnostics",
    --               sources = {"nvim_diagnostic"},
    --               sections = {"error", "warn", "info", "hint"},
    --               symbols = {
    --                   error = icons.diagnostics.Error,
    --                   hint = icons.diagnostics.Hint,
    --                   info = icons.diagnostics.Info,
    --                   warn = icons.diagnostics.Warn
    --               },
    --               colored = true,
    --               update_in_insert = false,
    --               always_visible = false
    --           }

    --           local diff = {
    --               "diff",
    --               symbols = {
    --                   added = icons.git.added .. " ",
    --                   untracked = icons.git.added .. " ",
    --                   modified = icons.git.changed .. " ",
    --                   removed = icons.git.deleted .. " "
    --               },
    --               colored = true,
    --               always_visible = false,
    --               source = function()
    --                   local gitsigns = vim.b.gitsigns_status_dict
    --                   if gitsigns then
    --                       return {
    --                           added = gitsigns.added,
    --                           modified = gitsigns.changed,
    --                           removed = gitsigns.removed
    --                       }
    --                   end
    --               end
    --           }

    --           return {
    --               options = {
    --                   theme = "auto",
    --                   globalstatus = true,
    --                   component_separators = {left = "", right = ""},
    --                   disabled_filetypes = {
    --                       statusline = {"dashboard", "lazy", "alpha"}
    --                   }
    --               },
    --               sections = {
    --                   lualine_a = {},
    --                   lualine_b = {},
    --                   lualine_c = {diff, diagnostics},
    --                   lualine_x = {},
    --                   lualine_y = {},
    --                   lualine_z = {}
    --               }
    --           }
    --       end
    --   },
    -- {
    --   'rmagatti/auto-session',
    --   config = function()
    --     require("auto-session").setup {
    --       log_level = "error",
    --       auto_session_suppress_dirs = { "~/", "~/Downloads" },
    --     }
    --   end
    -- },
    -- {
    --     "rebelot/heirline.nvim",
    --     enabled = true,
    --     event = "UiEnter",
    --     config = function()
    --         require("heirline").setup({
    --             statusline = require("thangphan.config.ui.statusline")
    --         })
    --     end
    -- },
    {
        "sindrets/diffview.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        keys = {
            {"<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffviewOpen"},
            {"<leader>gD", "<cmd>DiffviewClose<cr>", desc = "DiffviewClose"}
        },
        cmd = {
            "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
            "DiffviewFocusFiles", "DiffviewRefresh", "DiffviewFileHistory"
        },
        opts = {
            file_panel = {position = "bottom", height = 20},
            hooks = {
                view_opened = function()
                    ---@diagnostic disable-next-line: undefined-field
                    local stdout = vim.loop.new_tty(1, false)
                    if stdout ~= nil then
                        stdout:write(
                            ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
                                "DIFF_VIEW", vim.fn.system({"base64"}, "+4")))
                        vim.cmd([[redraw]])
                    end
                end,
                view_closed = function()
                    ---@diagnostic disable-next-line: undefined-field
                    local stdout = vim.loop.new_tty(1, false)
                    if stdout ~= nil then
                        stdout:write(
                            ("\x1bPtmux;\x1b\x1b]1337;SetUserVar=%s=%s\b\x1b\\"):format(
                                "DIFF_VIEW", vim.fn.system({"base64"}, "-1")))
                        vim.cmd([[redraw]])
                    end
                end
            }
        }
    }, -- {
    -- "dinhhuy258/git.nvim",
    -- event = "BufReadPre",
    --   config = function()
    --     require('git').setup({
    --       keymaps = {
    --         blame = "<Leader>gb",
    --         diff = "<Leader>gd",
    --       },
    --     })
    --   end
    -- },
    -- Prettier
    {'mhartington/formatter.nvim', config = require 'plugins.prettier'},
    {'neovim/nvim-lspconfig', config = require 'plugins.lsp'}, {
        "dnlhc/glance.nvim",
        cmd = "Glance",
        ---@class GlanceOpts
        opts = {border = {enable = true, top_char = "―", bottom_char = "―"}}
    }, {'yioneko/nvim-vtsls'}, {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        }
    }, {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({
                symbol_in_winbar = {enable = false},
                lightbulb = {
                    enable = false,
                    sign = true,
                    virtual_text = false,
                    debounce = 10,
                    sign_priority = 20
                }
            })
        end
    }, {'onsails/lspkind-nvim'},

    {"williamboman/mason.nvim", config = require('plugins/mason')},

    -- Set up null-ls to check spelling
    -- {
    --   "nvimtools/none-ls.nvim",
    --   enabled = false,
    --   dependencies = "neovim/nvim-lspconfig",
    --   config = function()
    --     local null_ls = require("null-ls")
    --     null_ls.setup({
    --       debounce = 150,
    --       save_after_format = false,
    --       sources = {
    --         -- TODO: migrate linters to nvim-lint
    --         -- TODO: migrate formatters to conform.nvim
    --         null_ls.builtins.code_actions.cspell,
    --         null_ls.builtins.code_actions.refactoring,
    --         null_ls.builtins.diagnostics.cspell,
    --         null_ls.builtins.diagnostics.fish,
    --         null_ls.builtins.diagnostics.flake8,
    --         null_ls.builtins.diagnostics.markdownlint,
    --         null_ls.builtins.formatting.black,
    --         null_ls.builtins.formatting.fish_indent,
    --         null_ls.builtins.formatting.mdformat,
    --         null_ls.builtins.formatting.prettier,
    --         null_ls.builtins.formatting.shfmt,
    --         null_ls.builtins.formatting.stylua,
    --         null_ls.builtins.code_actions.gitsigns,
    --         null_ls.builtins.diagnostics.selene.with({
    --           condition = function(utils)
    --             return utils.root_has_file({ "selene.toml" })
    --           end,
    --         }),
    --       },
    --       root_dir = require("null-ls.utils").root_pattern("package.json", ".null-ls-root", ".neoconf.json", ".git"),
    --     })
    --   end,
    -- },
    {
        "folke/noice.nvim",
        dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
        event = "VeryLazy",
        ---@class NoiceConfig
        opts = {
            ---@type NoicePresets
            presets = {inc_rename = true},
            ---@type NoiceConfigViews
            views = {
                cmdline_popup = {position = {row = 7, col = "55%"}},
                cmdline_popupmenu = {position = {row = 7, col = "55%"}}
            }
        }
    }, {
        "rcarriga/nvim-notify",
        opts = {
            background_colour = "#2E3440",
            stages = "static",
            timeout = 1500
        }
    }

    -- { 'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}, config = function()
    --   require("ibl").setup({
    --     scope = { enabled = false },
    --     indent = {
    --       char = "∘"
    --     }
    --   })
    --   end
    -- },

})
