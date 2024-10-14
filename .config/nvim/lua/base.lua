vim.cmd("autocmd!")
vim.cmd('set noswapfile')
vim.cmd [[ augroup highlight_yank]]
vim.cmd [[ autocmd!]]
vim.cmd [[ autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({higroup = "Substitute", timeout = 250})]]
vim.cmd [[ augroup END]]

vim.cmd("let g:git_messenger_floating_win_opts = { 'border': 'single'}")
vim.cmd("let g:git_messenger_popup_content_margins = v:false")

-- Define custom FZF command to exclude node_modules directory
vim.cmd([[
  let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'
]])

vim.env.FZF_DEFAULT_COMMAND = 'ag -g ""'

-- vim.g['closetag_filenames'] = '*.erb'
-- vim.g.markdown_fenced_languages = {'html', 'ruby'}

vim.o.termguicolors = true
-- Faster completion
vim.cmd('set updatetime=300')
vim.cmd('set timeoutlen=500')
vim.cmd('set pumheight=10')
vim.cmd('set mouse=a')
vim.cmd('set noshowmode')
vim.cmd('set hidden') -- Required to keep multiple buffers open multiple buffers
-- vim.cmd('set lazyredraw')       -- Improve scrolling performance when navigating through large results
vim.cmd('set ttyfast') -- U got a fast terminal
vim.cmd('set regexpengine=1')
vim.cmd('set synmaxcol=4096')
vim.cmd('set fo-=c fo-=r fo-=o')
vim.cmd('set completeopt=menu,menuone,noselect')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- vim.wo.number = true

vim.opt.autoindent = true
vim.opt.undofile = true
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1

-- Turn off statusline UI
vim.opt.laststatus = 0

-- hides the tabline, which is the line that displays the tabs at the top of Neovim.
-- vim.opt.showtabline = 0
vim.opt.showtabline = 1
vim.opt.expandtab = true
vim.opt.scrolloff = 5
-- vim.opt.shell = 'fish'
vim.opt.backupskip = {'/tmp/*', '/private/tmp/*'}
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = {'start', 'eol', 'indent'}
vim.opt.wildignore:append{'*/node_modules/*'}
vim.cmd('set clipboard=unnamedplus')

-- Stop continue comment
vim.cmd([[ au FileType * set fo-=c fo-=r fo-=o ]])

vim.cmd([[ au BufRead,BufNewFile *.cls,*.trigger,*.apex set filetype=apex ]])
