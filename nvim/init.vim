call plug#begin()

  " Plug 'ruanyl/vim-gh-line'

if has("nvim")
   " Language server
   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'williamboman/nvim-lsp-installer'
   Plug 'neovim/nvim-lspconfig'
   Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
   Plug 'onsails/lspkind-nvim'

   Plug 'preservim/nerdtree'
   Plug 'ryanoasis/vim-devicons'
   Plug 'Xuyuanp/nerdtree-git-plugin'
   Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

   " Cmp
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/nvim-cmp'

   " My Mood
   " Plug 'psliwka/vim-smoothie'

   " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
   " Plug 'mhinz/vim-startify'

   Plug 'nvim-lualine/lualine.nvim'
   Plug 'phaazon/hop.nvim'

   Plug 'alvan/vim-closetag'
   Plug 'nikvdp/ejs-syntax'
   Plug 'digitaltoad/vim-pug'

   " Snippet
   Plug 'L3MON4D3/LuaSnip'
   Plug 'saadparwaiz1/cmp_luasnip'

   " Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

   " Plug 'jceb/vim-orgmode'
   " Plug 'nvim-orgmode/orgmode'
   " Plug 'akinsho/org-bullets.nvim'
   " Plug 'dhruvasagar/vim-table-mode'

   "Sql
   Plug 'lighttiger2505/sqls.vim'
   Plug 'prabirshrestha/vim-lsp'
   Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

   Plug 'Djancyp/cheat-sheet'
   " Plug 'ap/vim-css-color'
   " Plug 'ray-x/lsp_signature.nvim'
   " Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
   " Plug 'kristijanhusak/defx-icons'
   " Plug 'kristijanhusak/defx-git'
   " Plug 'lukas-reineke/indent-blankline.nvim'
   " Plug 'sainnhe/everforest'
   " Plug 'Mofiqul/vscode.nvim'
   " Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
   " Plug 'andrewradev/splitjoin.vim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'numToStr/Comment.nvim'
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   Plug 'nvim-treesitter/playground'
   Plug 'windwp/nvim-ts-autotag'
   Plug 'xiyaowong/nvim-transparent'
 end

 " Auto pairs with treesitter
 Plug 'windwp/nvim-autopairs'
 " Plug 'tweekmonster/startuptime.vim'

call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.php, *.ejs'

" if executable('sqls')
"     augroup LspSqls
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"         \   'name': 'sqls',
"         \   'cmd': {server_info->['sqls']},
"         \   'whitelist': ['sql'],
"         \   'workspace_config': {
"         \     'sqls': {
"         \       'connections': [
"         \         {
"         \           'driver': 'mysql',
"         \            'dataSourceName': 'root:chaungoanbacho@tcp(localhost:3306)/notes',
"         \         },
"         \         {
"         \           'driver': 'postgresql',
"         \           'dataSourceName': 'host=127.0.0.1 port=15432 user=postgres password=mysecretpassword1234 dbname=dvdrental sslmode=disable',
"         \         },
"         \       ],
"         \     },
"         \   },
"         \ })
"     augroup END
" endif


" require("org-bullets").setup {
"     concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
"     symbols = {
"       -- headlines can be a list
"       headlines = { "◉", "○", "✿", "✸" },
"     }
"   }

lua << EOF

require("nvim-autopairs").setup {}

require("cheat-sheet").setup({
  auto_fill = {
    filetype = true,
    current_word = true,
  },

  main_win = {
    style = "minimal",
    border = "double",
  },

  input_win = {
    style = "minimal",
    border = "double",
  },
})

EOF

source ~/.config/nvim/sets.vim
source ~/.config/nvim/maps.vim
source ~/.config/nvim/after/plugins/treesitter.vim
" source ~/.config/nvim/after/plugins/conceal.scm
" source ~/.config/nvim/after/plugins/org-mode.vim
source ~/.config/nvim/after/plugins/lualine.vim
" source ~/.config/nvim/after/plugins/bufferline.vim
source ~/.config/nvim/after/plugins/tabline.vim
source ~/.config/nvim/after/plugins/hop.vim
source ~/.config/nvim/after/plugins/lspconfig.vim
source ~/.config/nvim/after/plugins/lspsaga.vim
source ~/.config/nvim/after/plugins/helper.lua
" source ~/.config/nvim/after/plugins/language-servers.vim
" source ~/.config/nvim/after/plugins/coc.vim
source ~/.config/nvim/after/plugins/cmp.vim
source ~/.config/nvim/after/plugins/luasnip.vim
" source ~/.config/nvim/after/plugins/defx.vim
source ~/.config/nvim/after/plugins/nerdtree.vim
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

" highlight the cmp icon when using the NeoSolarized
autocmd VimEnter * highlight CmpItemKind guifg=#93a1a1 

" Nerdtree
autocmd VimEnter * highlight NERDTreeGitStatusModified guifg=#FFD300
autocmd VimEnter * highlight NERDTreeGitStatusDirty guifg=#FFD300


" set termguicolors
" set background=dark " or light if you want light mode
" let g:everforest_background = 'hard'
" let g:everforest_vi_constract = 'soft'
" let g:everforest_better_performance = 1
" colorscheme everforest
