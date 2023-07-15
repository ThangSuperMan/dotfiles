return function()
  vim.cmd([[let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ejs,*.js,*.rs,*.jsp,*.xml']])
  vim.g['closetag_filenames'] = '*.erb'
end
