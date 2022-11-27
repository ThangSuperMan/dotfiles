call plug#begin()

  " Plug 'ruanyl/vim-gh-line'

if has("nvim")
   " Language server
   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'williamboman/nvim-lsp-installer'
   Plug 'neovim/nvim-lspconfig'
   Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
   Plug 'onsails/lspkind-nvim'

   " Plug 'preservim/nerdtree'
   Plug 'ryanoasis/vim-devicons'
   " Plug 'Xuyuanp/nerdtree-git-plugin'
   " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

   " Cmp
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/nvim-cmp'

   " Sql
   Plug 'tpope/vim-dadbod'
   Plug 'kristijanhusak/vim-dadbod-ui'
   Plug 'kristijanhusak/vim-dadbod-completion'

   Plug 'mg979/vim-visual-multi', {'branch': 'master'}

   Plug 'adi/vim-indent-rainbow'

   " My Mood
   " Plug 'psliwka/vim-smoothie'

   " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
   " Plug 'mhinz/vim-startify'

   Plug 'nvim-lualine/lualine.nvim'
   " Plug 'itchyny/lightline.vim'
   Plug 'phaazon/hop.nvim'

   Plug 'alvan/vim-closetag'
   Plug 'nikvdp/ejs-syntax'
   Plug 'digitaltoad/vim-pug'

   " Snippet
   Plug 'L3MON4D3/LuaSnip'
   Plug 'saadparwaiz1/cmp_luasnip'
   " Plug 'shmup/vim-sql-syntax'

   " Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

   " Plug 'jceb/vim-orgmode'
   " Plug 'nvim-orgmode/orgmode'
   " Plug 'akinsho/org-bullets.nvim'
   " Plug 'dhruvasagar/vim-table-mode'

   "Sql
   " Plug 'lighttiger2505/sqls.vim'
   " Plug 'prabirshrestha/vim-lsp'
   " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

   Plug 'Djancyp/cheat-sheet'
   " Plug 'ap/vim-css-color'
   " Plug 'ray-x/lsp_signature.nvim'
   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
   Plug 'kristijanhusak/defx-icons'
   Plug 'kristijanhusak/defx-git'
   Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
   " Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'sainnhe/everforest'
   Plug 'andrewradev/splitjoin.vim'
   Plug 'numToStr/Comment.nvim'
   " Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   " Plug 'nvim-treesitter/playground'
   " Plug 'windwp/nvim-ts-autotag'
   " Plug 'xiyaowong/nvim-transparent'
 end

 " Auto pairs with treesitter
 Plug 'windwp/nvim-autopairs'
 Plug 'tweekmonster/startuptime.vim'

call plug#end()


source ~/.config/nvim/sets.vim
source ~/.config/nvim/maps.vim
" source ~/.config/nvim/after/plugins/treesitter.vim
source ~/.config/nvim/after/plugins/lualine.vim
source ~/.config/nvim/after/plugins/auto-pairs.vim
source ~/.config/nvim/after/plugins/dadboy.vim
" source ~/.config/nvim/after/plugins/bufferline.vim
source ~/.config/nvim/after/plugins/tabline.vim
" source ~/.config/nvim/after/plugins/bufferline.vim
" source ~/.config/nvim/after/plugins/hop.vim
source ~/.config/nvim/after/plugins/lspconfig.vim
source ~/.config/nvim/after/plugins/lspsaga.vim
source ~/.config/nvim/after/plugins/denite.vim
" source ~/.config/nvim/after/plugins/helper.lua
" source ~/.config/nvim/after/plugins/language-servers.vim
" source ~/.config/nvim/after/plugins/coc.vim
source ~/.config/nvim/after/plugins/cmp.vim
source ~/.config/nvim/after/plugins/luasnip.vim
source ~/.config/nvim/after/plugins/defx.vim
source ~/.config/nvim/after/plugins/lspkind.vim
source ~/.config/nvim/after/plugins/comment.vim

"        /-----------------/
">>-----/    FUNCTIONS    /------------>
"      /-----------------/

" Super magic effect when yank something
augroup highlight_yank
    autocmd!
    " higroup = "Substitute",
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({ higroup = "Search", timeout = 150 })
augroup END

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" true color
if exists("&termguicolors") && exists("&winblend")
"  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
   set background=dark
   " Use NeoSolarized
   let g:neosolarized_termtrans=1
   runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
 endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
set exrc
"}}}

autocmd VimEnter * :hi CmpItemKind guibg=#073642
