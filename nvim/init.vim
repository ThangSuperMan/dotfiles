call plug#begin()

  " Plug 'ruanyl/vim-gh-line'

if has("nvim")
   " Language server
   " Plug 'neoclide/coc.nvim', {'branch': 'release'}
   " Plug 'williamboman/nvim-lsp-installer'
   Plug 'neovim/nvim-lspconfig'
   Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
   Plug 'onsails/lspkind-nvim'

   " Cmp
   Plug 'hrsh7th/cmp-nvim-lsp'
   Plug 'hrsh7th/cmp-buffer'
   Plug 'hrsh7th/nvim-cmp'

   Plug 'mg979/vim-visual-multi', {'branch': 'master'}
   " Plug 'mhinz/vim-startify'
   Plug 'yamatsum/nvim-nonicons'

   Plug 'phaazon/hop.nvim'

   Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }

   " Snippet
   Plug 'L3MON4D3/LuaSnip'
   Plug 'saadparwaiz1/cmp_luasnip'

   " Plug 'jceb/vim-orgmode'
   Plug 'nvim-orgmode/orgmode'
   Plug 'akinsho/org-bullets.nvim'
   Plug 'dhruvasagar/vim-table-mode'

   Plug 'Djancyp/cheat-sheet'
   Plug 'ap/vim-css-color'
   " Plug 'ray-x/lsp_signature.nvim'
   Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
   Plug 'kristijanhusak/defx-icons'
   Plug 'kristijanhusak/defx-git'
   " Plug 'lukas-reineke/indent-blankline.nvim'
   Plug 'sainnhe/everforest'
   Plug 'karoliskoncevicius/distilled-vim'
   Plug 'Mofiqul/vscode.nvim'
   Plug 'andreypopp/vim-colors-plain'
   Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
   Plug 'andrewradev/splitjoin.vim'
   Plug 'kyazdani42/nvim-web-devicons'
   Plug 'numToStr/Comment.nvim'
   Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
   Plug 'windwp/nvim-ts-autotag'
   Plug 'xiyaowong/nvim-transparent'
 end

 " Auto pairs with treesitter
 Plug 'windwp/nvim-autopairs'
 Plug 'tweekmonster/startuptime.vim'

call plug#end()

" syntax match OrgHeadlineStar1 /^\*\ze\s/me=e-1 conceal cchar=◉ containedin=OrgHeadlineLevel1 contained
" syntax match OrgHeadlineStar2 /^\*\{2}\ze\s/me=e-1 conceal cchar=○ containedin=OrgHeadlineLevel2 contained
" syntax match OrgHeadlineStar3 /^\*\{3}\ze\s/me=e-1 conceal cchar=✸ containedin=OrgHeadlineLevel3 contained
" syntax match OrgHeadlineStar4 /^\*{4}\ze\s/me=e-1 conceal cchar=✿ containedin=OrgHeadlineLevel4 contained

lua << EOF
require("org-bullets").setup {
    concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
  }

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
source ~/.config/nvim/after/plugins/org-mode.vim
" source ~/.config/nvim/after/plugins/lualine.vim
source ~/.config/nvim/after/plugins/galaxy-line.vim
source ~/.config/nvim/after/plugins/vscode-colorscheme.vim
source ~/.config/nvim/after/plugins/transparent.vim
source ~/.config/nvim/after/plugins/hop.vim
source ~/.config/nvim/after/plugins/lspconfig.vim
source ~/.config/nvim/after/plugins/lspsaga.vim
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
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout = 200 })
augroup END

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

" Mappings to make Vim more friendly towards presenting slides.
autocmd BufNewFile,BufRead *.txt call SetVimPresentationMode()
function SetVimPresentationMode()
  noremap <Left> :silent bp<CR> :redraw!<CR>
  noremap <Right> :silent bn<CR> :redraw!<CR>
  nmap <C-p> :set number! showcmd! hidden! ruler!<CR>
endfunction

" autocmd BufNewFile,BufRead *.org call SetOrgMode()
" function SetOrgMode()
"
" " Insert timestamp
" nnoremap <space>it :OrgDateInsertTimestampActiveCmdLine<CR>
"
" " Checkbox toggle
" nnoremap <space>ct :OrgCheckBoxToggle<CR>
"
" " Agenda Timeline
" nnoremap <space>tl :OrgAgendaTimeline<CR>
"
" endfunction


set termguicolors
set background=dark " or light if you want light mode
colorscheme vscode
hi  CursorLine term=bold cterm=bold guibg=#3e4446
hi Search guibg=#D7BA7D guifg=#1E1E1E

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
     

" set termguicolors
" set background=dark " or light if you want light mode
" let g:everforest_background = 'hard'
" let g:everforest_vi_constract = 'soft'
" let g:everforest_better_performance = 1
" colorscheme everforest
