local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  -- snapshot = "july-24",
  snapshot_path = fn.stdpath "config" .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
    prompt_border = "rounded", -- Border style of prompt popups.
  },
}

return require('packer').startup(function()
	-- packer can manage itself
  use 'wbthomason/packer.nvim'

  -- My mood
  -- use { 'psliwka/vim-smoothie' }
  use { 'xiyaowong/nvim-transparent', config = require 'plugins.transparent' }
  use { 'sainnhe/everforest', config = require 'plugins.theme' }

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require 'plugins.treesitter'
  }

  -- Colorizer
  use { 'norcalli/nvim-colorizer.lua', config = require 'plugins.colorizer' }

  -- Surround
  use { 'tpope/vim-surround' }
  use { 'windwp/nvim-ts-autotag' }
  use { 'alvan/vim-closetag', config = require 'plugins.closetag' }
  use { 'jiangmiao/auto-pairs' }

  use { 'terryma/vim-multiple-cursors' }

  -- Completion
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
  use { 'hrsh7th/nvim-cmp', config = require 'plugins.cmp' }

  use { 'nvim-telescope/telescope.nvim', config = require 'plugins.telescope' }

  -- Write notes
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
  use { 'tpope/vim-commentary' }

  -- Lsp
  use { 'neovim/nvim-lspconfig', config = require 'plugins.lsp' }
  use { 'glepnir/lspsaga.nvim', branch = 'main', config = require 'plugins.saga' }
  use { 'onsails/lspkind-nvim', config = require 'plugins.kind' }

  -- debugging
  --config = require('plugins.lualine')
  use { 'mfussenegger/nvim-dap', config = require 'plugins.dap' }
  use { 'leoluz/nvim-dap-go', config = function()
    require('dap-go').setup()
  end
  }
  use { 'rcarriga/nvim-dap-ui', config = require 'plugins.dapui'}
  use { 'theHamsta/nvim-dap-virtual-text', config = function()
    require('nvim-dap-virtual-text').setup()
    vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})
  end}
  use 'nvim-telescope/telescope-dap.nvim'

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

  -- Prettier
  use { 'mhartington/formatter.nvim', config = require 'plugins.prettier' }
  use 'simrat39/rust-tools.nvim'

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
            },
        },
        config = require('plugins.neotree')
    }

  
  -- use { 'Yggdroot/indentLine',
  --   config = function()
  --     vim.g.indentLine_char = '|'
  --   end
  -- }

  use { "lukas-reineke/indent-blankline.nvim" , config = function ()
        require("indent_blankline").setup({
            show_current_context = false,
            show_current_context_start = true,
            filetype_exclude = {"help", "txt", "norg", "md"},
            buftype_exclude = {"terminal", "nofile"}
        })
        -- vim.g.indent_blankline_char = "∘•"
    end}

end)
