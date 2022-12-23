return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

  -- My mood
  use { 'psliwka/vim-smoothie' }
  use { 'xiyaowong/nvim-transparent', config = require 'plugins.transparent' }
  use { 'sainnhe/everforest', config = require 'plugins.theme' }
  -- use { 'karb94/neoscroll.nvim', config = require 'plugins.neoscroll' }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require 'plugins.treesitter'
  }

  use {
      'voldikss/vim-floaterm',
      config = function()
          vim.g.floaterm_wintype = 'float'
          vim.g.floaterm_position = 'bottomright'
          vim.g.floaterm_width = 0.6
          vim.g.floaterm_height = 0.5
          vim.g.floaterm_keymap_toggle = '<C-\\>'
      end
  }

  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua', config = require 'plugins.colorizer' }

  -- Surround
  use { 'tpope/vim-surround' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'jiangmiao/auto-pairs' }

  -- Completion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/nvim-cmp', config = require 'plugins.cmp' }

  use { 'nvim-telescope/telescope.nvim', config = require 'plugins.telescope' }

  use {'nvim-orgmode/orgmode', config = function()
  end}
  use {'akinsho/org-bullets.nvim', config = function()
    require('org-bullets').setup({
      concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
      symbols = {
        -- headlines can be a list
        headlines = { "◉", "✿", "○", "✸" },
        -- or a function that receives the defaults and returns a list
        checkboxes = {
          half = { "", "OrgTSCheckboxHalfChecked" },
          done = { "✓", "OrgDone" },
          todo = { "˟", "OrgTODO" },
        },
      }
    })
  end}

  -- Comment
  use { 'JoosepAlviste/nvim-ts-context-commentstring' }
  use { 'tpope/vim-commentary' }

  -- Lsp
  use { 'neovim/nvim-lspconfig', config = require 'plugins.lsp' }
  use { 'glepnir/lspsaga.nvim', branch = 'main', config = require 'plugins.saga' }
  use { 'onsails/lspkind-nvim', config = require 'plugins.kind' }

  -- Snippet
  use { 'L3MON4D3/LuaSnip' }
  use { 'saadparwaiz1/cmp_luasnip', config = require 'plugins.luasnip' }

  -- Barbar, bufferline
  use { 'romgrk/barbar.nvim', config = require 'plugins.barbar' }

  use { 'kyazdani42/nvim-web-devicons' }

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = require('plugins.lualine')
  }

  use { 'mhartington/formatter.nvim', config = require 'plugins.prettier' }

  -- Git
  use { 'tpope/vim-fugitive' }

	use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim", {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = {
                                    'neo-tree', "neo-tree-popup", "notify",
                                    "quickfix"
                                },

                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal' }
                            }
                        },
                        other_win_hl_color = '#f3a14e'
                    })
                end
            }
        },
        config = require('plugins.neotree')
    }

  -- use { "lukas-reineke/indent-blankline.nvim" , config = function ()
  --       require("indent_blankline").setup({
  --           show_current_context = true,
  --           show_current_context_start = true,
  --           filetype_exclude = {"help", "txt", "norg", "md"},
  --           buftype_exclude = {"terminal", "nofile"}
  --       })
  --       -- vim.g.indent_blankline_char = "∘•"
  --       vimvim.g.indent_blankline_char = "∘•"
  --   end}

end)
