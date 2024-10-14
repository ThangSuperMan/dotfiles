local utils = require("heirline.utils")

local Icons = {
    fillchars = {diff = "╱", eob = " "},
    lsp_kind = {
        Text = " ",
        String = " ",
        Method = " ",
        Function = " ",
        KeywordFunction = " ",
        Constructor = " ",
        Field = " ",
        Variable = " ",
        Class = " ",
        Copilot = " ",
        Interface = " ",
        Module = " ",
        Property = " ",
        Unit = " ",
        Value = " ",
        Enum = " ",
        Keyword = " ",
        Snippet = " ",
        Comment = " ",
        Error = " ",
        Color = " ",
        File = " ",
        Reference = " ",
        Folder = " ",
        EnumMember = " ",
        Constant = " ",
        Struct = " ",
        Event = " ",
        Operator = " ",
        TypeParameter = " ",
        KeywordOperator = " ",
        KeywordConditional = " ",
        StringSpecialSymbol = " ",
        VariableMember = " ",
        Nospell = " ",
        None = " "
    },
    listchars = {
        space = " ",
        tab = " ",
        trail = "•",
        extends = "❯",
        precedes = "❮",
        nbsp = "␣"
    },
    diagnostics = {
        " ",
        " ",
        " ",
        " ",
        ERROR = " ",
        WARNING = " ",
        INFO = " ",
        HINT = " ",
        DEBUG = " ",
        TRACE = " "
    },
    dap = {
        breakpoint = " ",
        breakpoint_condition = " ",
        log_point = " ",
        stopped = " ",
        breakpoint_rejected = " ",
        pause = " ",
        play = " ",
        step_into = " ",
        step_over = " ",
        step_out = " ",
        step_back = " ",
        run_last = " ",
        terminate = " "
    },
    git = {
        status_added = " ",
        status_removed = " ",
        status_modified = " ",
        added = " ",
        deleted = " ",
        modified = " ",
        renamed = " ",
        untracked = " ",
        ignored = " ",
        unstaged = " ",
        staged = " ",
        conflict = " "
    },
    misc = {
        collapsed = " ",
        expanded = " ",
        current = " ",
        folder_empty = "",
        folder_closed = "",
        folder_open = "",
        file = "",
        v_border = "▐",
        v_pipe = "▎"
    }
}

local Colors = {
    none = "NONE",
    black = "#181a1b",
    bg0 = "#22252A",
    bg1 = "#282C34",
    bg15 = "#2d313b",
    bg2 = "#363a4e",
    bg3 = "#393e53",
    bg4 = "#3f445b",
    grey_dim = "#5c6071",
    grey = "#7e8294",
    grey_light = "#959da9",
    fg = "#c5cdd9",
    white = "#fcfcfc",
    red = "#E06C75",
    bg_red = "#b5585f",
    lt_red = "#eed8da",
    line_red = "#513436",
    orange = "#FFCB6B",
    bg_orange = "#d4a959",
    lt_orange = "#f5ebd9",
    line_orange = "#3e3d3a",
    yellow = "#FFE082",
    bg_yellow = "#d4bb6c",
    lt_yellow = "#f5efdd",
    green = "#C3E88D",
    bg_green = "#9fbd73",
    lt_green = "#f3f6ed",
    line_green = "#39403d",
    cyan = "#89ddff", -- "#6ce0cf",
    bg_cyan = "#58b5a8",
    lt_cyan = "#d8eeeb",
    blue = "#82AAFF",
    bg_blue = "#6c8ed4",
    lt_blue = "#dde5f5",
    line_blue = "#363a4e",
    purple = "#C792EA",
    bg_purple = "#a377bf",
    md_purple = "#c3a7e5",
    lt_purple = "#eadff0",
    line_purple = "#383746",
    active = "#98c379",
    inactive = "#90AB7B",
    -- error_fg    = "#fc6e79",
    error_bg = "#403536",
    -- warn_fg     = "#ffb52e",
    warn_bg = "#403b35",
    -- hint_fg     = "#cdff82",
    hint_bg = "#354036",
    -- info_fg     = "#a5d2f8",
    info_bg = "#393342"
}

local conditions = require("heirline.conditions")

local Padding = function(n) return {provider = string.rep(" ", n)} end

local Mode = function(icon)
    return {
        init = function(self)
            self.mode = vim.fn.mode(1)

            if not self.once then
                vim.api.nvim_create_autocmd("ModeChanged", {
                    pattern = "*:*o",
                    command = 'redrawstatus'
                })
                self.once = true
            end
        end,
        static = {
            mode_colors = {
                n = Colors.green,
                i = Colors.blue,
                v = Colors.purple,
                [""] = Colors.purple,
                V = Colors.purple,
                c = Colors.orange,
                no = Colors.red,
                s = Colors.orange,
                S = Colors.orange,
                [""] = Colors.orange,
                ic = Colors.yellow,
                R = Colors.red,
                Rv = Colors.red,
                cv = Colors.red,
                ce = Colors.red,
                r = Colors.red,
                rm = Colors.red,
                ["r?"] = Colors.cyan,
                ["!"] = Colors.red,
                t = Colors.yellow
            }
        },
        provider = function() return icon end,
        hl = function(self) return {fg = self.mode_colors[self.mode]} end,
        update = {"ModeChanged"}
    }
end

local FileSize = {
    provider = function()
        local suffix = {'b', 'k', 'M', 'G', 'T', 'P', 'E'}
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then return fsize .. suffix[1] end
        local i = math.floor((math.log(fsize) / math.log(1024)))

        return string.format("%.2g%s", fsize / math.pow(1024, i), suffix[i + 1])
    end
}

local FileLines = {provider = "%4L"}

local FileIcon = {
    init = function(self)
        local filename = vim.api.nvim_buf_get_name(0)
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color =
            require("nvim-web-devicons").get_icon_color(filename, extension,
                                                        {default = true})
    end,
    provider = function(self) return self.icon and (self.icon .. " ") end,
    hl = function(self) return {fg = self.icon_color} end
}

local FilePath = {
    provider = function()
        local filepath = vim.fn.expand("%:.")

        if filepath == "" then return "[No Name]" end

        if not conditions.width_percent_below(#filepath, 0.25) then
            filepath = vim.fn.pathshorten(filepath)
        end

        return filepath
    end,
    hl = function()
        if vim.bo.modified then
            return {fg = Colors.red, force = true, bold = false}
        else
            return {fg = Colors.purple}
        end
    end
}

local FileFlags = {
    {
        condition = function() return vim.bo.binary end,
        provider = "  ",
        hl = {fg = Colors.blue}
    }, {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "  ",
        hl = {fg = Colors.orange}
    }
}

local Ruler = {provider = "%5(%3l:%-2c%)"}

local ScrollBar = {
    static = {sbar = {'▁', '▂', '▃', '▄', '▅', '▆', '▇', '█'}},
    provider = function(self)
        local i = math.floor((vim.fn.line(".") - 1) / vim.fn.line("$") *
                                 #self.sbar) + 1

        return string.rep(self.sbar[i], 2)
    end,
    hl = {fg = Colors.blue, bg = Colors.bg2}
}

local Diagnostics = {
    condition = conditions.has_diagnostics,
    static = {
        error_icon = Icons.diagnostics.ERROR,
        warn_icon = Icons.diagnostics.WARNING,
        info_icon = Icons.diagnostics.INFO,
        hint_icon = Icons.diagnostics.HINT
    },
    init = function(self)
        local function count(severity)
            return #vim.diagnostic.get(0, {
                severity = vim.diagnostic.severity[severity]
            })
        end

        self.errors = count("ERROR")
        self.warnings = count("WARN")
        self.hints = count("HINT")
        self.info = count("INFO")
    end,
    update = {"DiagnosticChanged", "BufEnter"},
    {
        {
            provider = function(self) return self.error_icon end,
            hl = {fg = Colors.bg_red}
        }, {
            provider = function(self) return self.errors .. "  " end,
            hl = {fg = Colors.red, bold = true}
        }
    },
    {
        {
            provider = function(self) return self.warn_icon end,
            hl = {fg = Colors.bg_orange}
        }, {
            provider = function(self) return self.warnings .. "  " end,
            hl = {fg = Colors.orange, bold = true}
        }
    },
    {
        {
            provider = function(self) return self.info_icon end,
            hl = {fg = Colors.bg_blue}
        }, {
            provider = function(self) return self.info .. "  " end,
            hl = {fg = Colors.blue, bold = true}
        }
    },
    {
        {
            provider = function(self) return self.hint_icon end,
            hl = {fg = Colors.bg_green}
        }, {
            provider = function(self) return self.hints .. "  " end,
            hl = {fg = Colors.green, bold = true}
        }
    }
}

local separator = {provider = "%="}

local border = {provider = Icons.misc.v_border .. " ", hl = {fg = Colors.bg2}}

local LSP = {
    {provider = " ", hl = {fg = Colors.bg_purple}},
    {
        provider = function()
            local names = vim.tbl_map(function(client)
                return client.name
            end, vim.lsp.get_active_clients({bufnr = 0}))

            return table.concat(names, " ")
        end,
        hl = {fg = Colors.bg_blue, bold = true, italic = true}
    },
    Padding(1),
    border,
    update = {'LspAttach', 'LspDetach'},
    condition = conditions.lsp_attached
}

local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or
                               self.status_dict.removed ~= 0 or
                               self.status_dict.changed ~= 0
    end,
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and (" +" .. count .. " ")
        end,
        hl = {fg = Colors.green}
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and (" -" .. count .. " ")
        end,
        hl = {fg = Colors.red}
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and (" ~" .. count .. " ")
        end,
        hl = {fg = Colors.blue}
    },
    {
        Padding(1),
        border,
        Padding(1),
        condition = function(self) return self.has_changes end
    },
    {
        provider = function(self) return self.status_dict.head end,
        hl = {fg = Colors.purple, bold = true}
    },
    Padding(1)
}

local left = {
    Mode("  "), Padding(2), FileSize, Padding(2), FileIcon, FilePath,
    FileFlags, Padding(2), FileLines, Padding(2), Ruler, Padding(3), ScrollBar
}

local center = {Diagnostics}

local right = {
    -- LSP, Padding(1), Git
    LSP, Padding(1)
}

return {
    Mode("▉ "),
    left,
    separator,
    center,
    separator,
    right,
    Mode(" ▉"),
    hl = {bg = Colors.white, fg = Colors.bg0}
}
