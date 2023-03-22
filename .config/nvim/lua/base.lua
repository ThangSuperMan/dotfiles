vim.cmd("autocmd!")
vim.cmd('set noswapfile')
vim.cmd [[ augroup highlight_yank]]
vim.cmd [[ autocmd!]]
vim.cmd [[ autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = "DiffDelete", timeout = 100})]]
vim.cmd [[ augroup END]]

vim.o.termguicolors = true
-- Faster completion
vim.cmd('set updatetime=300')
vim.cmd('set timeoutlen=500')
-- vim.cmd('set list listchars=tab:»·,trail:·')
-- vim.cmd('set backspace=indent,eol,start')
vim.cmd('set mouse=a')
vim.cmd('set noshowmode')
vim.cmd('set hidden') -- Required to keep multiple buffers open multiple buffers
vim.cmd('set lazyredraw') -- Improve scrolling performance when navigating through large results
vim.cmd('set ttyfast') -- U got a fast terminal
vim.cmd('set synmaxcol=4096')
-- vim.cmd('set formatoptions-=cro')                  -- Stop newline continution of comments
-- vim.cmd('set scroll=15')
vim.cmd('set shortmess+=c')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.title = true
vim.opt.autoindent = true
vim.opt.undofile = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'fish'
vim.opt.backupskip = { '/tmp/*', '/private/tmp/*' }
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append { '*/node_modules/*' }

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Go file config
vim.cmd([[au FileType go set noexpandtab]])
vim.cmd([[au FileType go set shiftwidth=4]])
vim.cmd([[au FileType go set softtabstop=4]])
vim.cmd([[au FileType go set tabstop=4]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

-- Add asterisks in block comments
vim.opt.formatoptions:append { 'r' }
