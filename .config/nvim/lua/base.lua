vim.cmd("autocmd!")
vim.cmd('set noswapfile')
vim.cmd [[ augroup highlight_yank]]
vim.cmd [[ autocmd!]]
vim.cmd [[ autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = "Substitute", timeout = 200})]]
vim.cmd [[ augroup END]]

vim.g['closetag_filenames'] = '*.erb'

vim.o.termguicolors = true
-- Faster completion
vim.cmd('set updatetime=300')
vim.cmd('set timeoutlen=500')
-- vim.opt.listchars = {eol = "↵'", trail = "·", tab = '»'}
vim.cmd('set mouse=a')
vim.cmd('set noshowmode')
vim.cmd('set hidden') -- Required to keep multiple buffers open multiple buffers
vim.cmd('set lazyredraw') -- Improve scrolling performance when navigating through large results
vim.cmd('set ttyfast') -- U got a fast terminal
vim.cmd('set synmaxcol=4096')
-- vim.cmd('set formatoptions-=cro')                  -- Stop newline continution of comments
-- vim.cmd('set scroll=15')
vim.cmd('set shortmess+=c')

-- Disable auto comment
vim.api.nvim_exec([[
augroup disable_auto_comment
  autocmd!
  autocmd FileType * setlocal formatoptions-=cro
augroup END
]], false)

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
-- vim.opt.smarttab = true
-- vim.opt.breakindent = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { 'start', 'eol', 'indent' }
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
-- vim.opt.wildignore:append { '*/node_modules/*' }

-- vim.cmd('set list')
-- Disable tabline when we have more than one
vim.cmd('set showtabline=0')
-- vim.cmd('set list listchars=tab:»·,trail:·')
-- vim.cmd('set listchars=tab:»·,space:·')
-- vim.cmd('set backspace=indent,eol,start')
-- vim.cmd('set listchars=space:·,trail:·,tab:»·,extends:>,precedes:<')

-- Enable automatic trailing whitespace removal
vim.cmd([[au BufWritePre *.rb :%s/\s\+$//e]])

-- Go file config
vim.cmd([[au FileType go set noexpandtab]])
vim.cmd([[au FileType go set shiftwidth=4]])
vim.cmd([[au FileType go set softtabstop=4]])
vim.cmd([[au FileType go set tabstop=4]])
