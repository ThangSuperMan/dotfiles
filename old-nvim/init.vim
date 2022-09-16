call plug#begin()

  " Plug 'ruanyl/vim-gh-line'

if has("nvim")
   " Language server
   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
   Plug 'neovim/nvim-lspconfig'
   Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
   Plug 'onsails/lspkind-nvim'
   " Plug 'williamboman/nvim-lsp-installer'

   " Cmp
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/nvim-cmp'

   " Ruby
   Plug 'tpope/vim-rails'

   " Snippet
   Plug 'L3MON4D3/LuaSnip'
   Plug 'saadparwaiz1/cmp_luasnip'

   Plug 'Djancyp/cheat-sheet'

   " Plug 'romgrk/barbar.nvim'

   Plug 'ldelossa/buffertag'
   Plug 'ap/vim-css-color'
   " Plug 'ray-x/lsp_signature.nvim'
   " Plug 'windwp/nvim-ts-autotag'
   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
   Plug 'kristijanhusak/defx-icons'
   Plug 'kristijanhusak/defx-git'
   Plug 'sainnhe/everforest'
   Plug 'tobi-wan-kenobi/zengarden'
   Plug 'Mofiqul/dracula.nvim'
   Plug 'andrewradev/splitjoin.vim'
   Plug 'AndrewRadev/tagalong.vim'
   Plug 'AndrewRadev/sideways.vim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'numToStr/Comment.nvim'
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   Plug 'alvan/vim-closetag'
   Plug 'xiyaowong/nvim-transparent'
 end

 " Auto pairs with treesitter
 Plug 'windwp/nvim-autopairs'
 Plug 'tweekmonster/startuptime.vim'

call plug#end()

" Customization for the defx
autocmd VimEnter * :hi PreProc ctermfg=9 guifg=#268bd2
autocmd VimEnter * :hi CmpItemKindDefault guifg=#7C8C8E

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

nnoremap <c-h> :SidewaysLeft<cr>
nnoremap <c-l> :SidewaysRight<cr>

let g:closetag_filenames = '*.html, *.erb, *.tsx, *.js'

source ~/.config/nvim/sets.vim
source ~/.config/nvim/maps.vim
source ~/.config/nvim/after/plugins/treesitter.vim
source ~/.config/nvim/after/plugins/lualine.vim
source ~/.config/nvim/after/plugins/tabline.vim
" source ~/.config/nvim/after/plugins/language-servers.vim
source ~/.config/nvim/after/plugins/lspconfig.vim
source ~/.config/nvim/after/plugins/lspsaga.vim
source ~/.config/nvim/after/plugins/cmp.vim
source ~/.config/nvim/after/plugins/luasnip.vim
source ~/.config/nvim/after/plugins/lspkind.vim
source ~/.config/nvim/after/plugins/defx.vim
source ~/.config/nvim/after/plugins/comment.vim

"        /-----------------/
">>-----/    FUNCTIONS    /------------>
"      /-----------------/

" Super magic effect when yank something
augroup highlight_yank
    autocmd!
    " higroup = "Substitute",
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({ higroup = "Search", timeout = 100})
augroup END

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" true color
" if exists("&termguicolors") && exists("&winblend")
"   syntax enable
"   set termguicolors
"   set winblend=0
"   set wildoptions=pum
"   set pumblend=5
"   set background=dark
"   " Use NeoSolarized
"   let g:neosolarized_termtrans=1
"   runtime ./colors/NeoSolarized.vim
"   colorscheme NeoSolarized
" endif

"}}}

" Extras "{{{
" ---------------------------------------------------------------------
" set exrc
"}}}
  
set termguicolors
set background=dark " or light if you want light mode
let g:everforest_background = 'hard'
let g:everforest_vi_constract = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest
