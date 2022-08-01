local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- general
  use 'AndrewRadev/splitjoin.vim'
  use 'alvan/vim-closetag'
  use 'jiangmiao/auto-pairs'
  use 'tpope/vim-surround'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'nvim-lualine/lualine.nvim'
  use {"akinsho/toggleterm.nvim", tag = 'v2.*', config = function()
  require("toggleterm").setup()
  end}

	use 'ldelossa/buffertag'
  use 'windwp/nvim-ts-autotag'

	-- Debugging
	use 'mfussenegger/nvim-dap'

  -- File explores 
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
                    require'window-picker'.setup({
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
                                buftype = {'terminal'}
                            }
                        },
                        other_win_hl_color = '#f3a14e'
                    })
                end
            }
        },
    }

  -- Signature
  use 'ray-x/lsp_signature.nvim'
	use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
    })

  -- tree sitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- use 'nvim-treesitter/playground'

  use 'onsails/lspkind-nvim'
   use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
   }

  -- language server
  use 'neovim/nvim-lspconfig'

  use 'ap/vim-css-color'

  -- autocomplete
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/cmp-vsnip'

  -- themes
  use 'sainnhe/everforest'
	use 'tweekmonster/startuptime.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
   require('packer').sync()
  end
end)
