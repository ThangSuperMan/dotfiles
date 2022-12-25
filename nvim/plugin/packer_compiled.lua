-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/thangphan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/thangphan/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/thangphan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/thangphan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/thangphan/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\6\28icon_separator_inactive\5\26icon_separator_active\5\19icon_close_tab\bÔôò\14clickable\2\rtabpages\2\14animation\2\15bufferline\6g\bvim\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  cmp_luasnip = {
    config = { "\27LJ\2\nG\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3Ä-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0¿\vexpand\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ˇˇB\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjump\rjumpableM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeﬁ\4\1\0\n\0\"\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0B\1\2\0019\1\5\0009\1\6\0015\3\a\0004\4\0\b6\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\r\0005\a\v\0004\b\3\0005\t\n\0>\t\1\b=\b\f\a=\a\14\6<\6\5\4=\4\15\3B\1\2\0016\1\16\0009\1\17\0019\1\18\0015\3\19\0'\4\20\0003\5\21\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\22\0'\4\23\0003\5\24\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\25\0'\4\26\0003\5\27\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\28\0'\4\29\0003\5\30\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\31\0'\4 \0003\5!\0B\1\4\0012\0\0ÄK\0\1\0\0\n<a-h>\1\3\0\0\6i\6s\0\n<c-c>\1\3\0\0\6i\6s\0\n<c-k>\1\3\0\0\6i\6s\0\n<c-j>\1\3\0\0\6i\6s\0\n<a-p>\1\3\0\0\6i\6s\bset\vkeymap\bvim\rext_opts\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\b‚óè\18GruvboxOrange\15choiceNode\23luasnip.util.types\1\0\3\fhistory\2\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\1\0\1\npaths\29~/.config/nvim/snippets/\tload\29luasnip.loaders.from_lua\fluasnip\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  everforest = {
    config = { "\27LJ\2\nö\2\0\0\4\0\v\0\0276\0\0\0009\0\1\0\18\1\0\0'\3\2\0B\1\2\0016\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2\1\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\1\18\1\0\0'\3\b\0B\1\2\1\18\1\0\0'\3\t\0B\1\2\1\18\1\0\0'\3\n\0B\1\2\1K\0\1\0\27colorscheme everforest\22set termguicolors\24set background=dark&everforest_disable_italic_comment\29everforest_enable_italic\tdark\26everforest_background\6g\14syntax on\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/everforest",
    url = "https://github.com/sainnhe/everforest"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\ná\1\0\0\5\0\6\0\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\2>\2\2\1=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\22--stdin-file-path\0\f--write\1\0\2\nstdin\2\bexe\16rome formatÄ\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5ÄÄ¿ô\4#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\2\bexe\ngofmt(\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\2\bexe\15lua-formatô\5\1\0\t\0\29\0@6\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0+\6\2\0B\3\3\0019\3\b\0005\5\t\0005\6\n\0004\a\3\0>\2\1\a=\a\v\0064\a\3\0>\2\1\a=\a\f\0064\a\3\0>\2\1\a=\a\r\0064\a\3\0>\2\1\a=\a\14\0064\a\3\0>\2\1\a=\a\15\0064\a\3\0>\2\1\a=\a\16\0064\a\3\0>\2\1\a=\a\17\0064\a\3\0>\2\1\a=\a\18\0064\a\3\0>\2\1\a=\a\19\0064\a\3\0>\2\1\a=\a\20\0064\a\3\0>\2\1\a=\a\21\0064\a\3\0>\2\1\a=\a\22\0064\a\3\0>\2\1\a=\a\23\0064\a\3\0003\b\24\0>\b\1\a=\a\25\0064\a\3\0003\b\26\0>\b\1\a=\a\27\6=\6\28\5B\3\2\1K\0\1\0\rfiletype\blua\0\ago\0\ash\rmarkdown\tyaml\tscss\tjson\bvue\bcss\vsvelte\thtml\15javascript\15typescript\20typescriptreact\20javascriptreact\1\0\0\1\0\1\flogging\1\nsetup„\1        augroup FormatAutogroup\n          autocmd!\n          autocmd BufWritePost *.js,*.mjs,*.ts,*.lua,*.jsx,*.tsx,*.md,*.mdx,*.yml,*.json,*.css,*.scss,*.html,*.vue,*.svelte,*.sol,*.go FormatWrite\n        augroup END\n    \14nvim_exec\bapi\bvim\0\0\14formatter\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n—\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\5\0\0\thelp\btxt\tnorg\amd\1\0\2\31show_current_context_start\2\25show_current_context\1\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\nº\5\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\25\vMethod\19 Ôö¶  (Method)\tFile\17 Ôúì  (File)\tText\18 Ôíû  (Text) \14Reference\22 Ôúú  (Reference)\nColor\18 Ô£ó  (Color)\vFolder\19 Ôùä  (Folder)\fSnippet\20 ÔÉÑ  (Snippet)\15EnumMember\23 ÔÖù  (EnumMember)\fKeyword\20 Ô†ä  (Keyword)\rConstant\21 Ô≤Ä  (Constant)\tEnum\16 Ô©ó (Enum)\vStruct\19 Ô≥§  (Struct)\nValue\18 Ô¢ü  (Value)\nEvent\18 ÔÉß  (Event)\tUnit\17 Ôëµ  (Unit)\rOperator\21 Ôó´  (Operator)\rProperty\20 Ô™∂ (Property)\18TypeParameter\26 ÔûÉ  (TypeParameter)\vModule\19 Ôô®  (Module)\14Interface\22 Ô∞Æ  (Interface)\nClass\18 Ô†ñ  (Class)\rVariable\21[Óúñ] (Variable)\nField\18 Ô∞†  (Field)\16Constructor\24 Ôê•  (Constructor)\rFunction\21 Ôûî  (Function)\1\0\2\vpreset\rcodicons\tmode\vsymbol\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\2K\0\1\0\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n˛\5\0\0\a\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\23\0005\5\19\0005\6\18\0=\6\20\0055\6\21\0=\6\22\5>\5\1\4=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\3=\3\29\0025\3\30\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0034\4\3\0005\5\31\0>\5\1\4=\4\17\0035\4 \0=\4\24\0034\4\0\0=\4\26\0034\4\0\0=\4\28\3=\3!\0024\3\0\0=\3\"\0025\3#\0=\3$\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\0\rencoding\rfiletype\fsources\1\2\0\0\20nvim_diagnostic\fsymbols\1\2\0\0\16diagnostics\1\0\4\tinfo\tÔëâ \twarn\tÔÅ± \nerror\tÔÜà \thint\tÔÉ´ \14lualine_c\1\2\2\0\rfilename\16file_status\2\tpath\3\0\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\25component_separators\1\0\2\tleft\5\nright\bÓÇ≥\23section_separators\1\0\2\tleft\5\nright\5\1\0\2\ntheme\15everforest\18icons_enabled\2\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\nû\17\0\0\a\0008\0M6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\4=\4\21\3=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\27\0005\5\26\0=\5\28\0045\5\29\0005\6\30\0=\6\31\5=\5 \4=\4!\3=\3\"\0024\3\0\0=\3#\0025\3(\0005\4$\0004\5\0\0=\5%\0044\5\0\0=\5&\0044\5\0\0=\5'\4=\4)\0036\4*\0=\4+\0035\4-\0005\5,\0=\5!\4=\4\"\3=\3.\0025\3/\0005\0041\0005\0050\0=\5!\4=\4\"\3=\0032\0025\0035\0005\0043\0005\0054\0=\5!\4=\4\"\3=\3\21\2B\0\2\0016\0\0\0009\0\1\0'\0026\0B\0\2\0016\0\0\0009\0\1\0'\0027\0B\0\2\1K\0\1\0'nnoremap <c-b> :Neotree toggle<cr>'nnoremap <c-f> :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\6A\16git_add_all\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\t<bs>\16navigate_up\6.\rset_root\abd\18buffer_delete\1\0\3\21group_empty_dirs\2\24follow_current_file\2\18show_unloaded\2\15filesystem\1\0\0\1\0\t\6H\18toggle_hidden\6C\rset_root\6U\16navigate_up\a]g\22next_git_modified\a[g\22prev_git_modified\n<c-x>\17clear_filter\6D\27fuzzy_finder_directory\6/\17fuzzy_finder\6f\21filter_on_submit\27use_libuv_file_watcher\btru\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_current\21group_empty_dirs\1\24follow_current_file\2\15never_show\20hide_by_pattern\17hide_by_name\1\0\4\18hide_dotfiles\2\fvisible\1\16hide_hidden\2\20hide_gitignored\2\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\15\6r\vrename\6o\topen\6R\frefresh\6S\15open_split\6p\25paste_from_clipboard\6d\vdelete\t<cr>\topen\18<2-LeftMouse>\topen\6q\17close_window\6z\15close_node\6K\18add_directory\6?\14show_help\6c\22copy_to_clipboard\6s\16open_vsplit\6m\21cut_to_clipboard\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\tleft\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\runstaged\bÔò∞\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\bÔïî\fdeleted\b‚úñ\nadded\5\rconflict\bÓúß\vstaged\bÔÅÜ\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\fdefault\6*\14highlight\20NeoTreeFileIcon\17folder_empty\bÔ∞ä\16folder_open\bÓóæ\18folder_closed\bÓóø\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\5\26sort_case_insensitive\1\23enable_diagnostics\1\22enable_git_status\1\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2\v\0\1\1\0\0\0\1K\0\1\0}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\nÄ-\1\1\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\2\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\3¿\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleí\6\1\0\14\0/\0Q6\0\0\0'\1\2\0=\1\1\0006\0\3\0'\2\4\0B\0\2\0026\1\3\0'\3\5\0B\1\2\0026\2\3\0'\4\6\0B\2\2\0023\3\a\0009\4\b\0005\6\f\0005\a\n\0003\b\t\0=\b\v\a=\a\r\0065\a\18\0009\b\14\0015\n\15\0005\v\16\0=\v\17\nB\b\2\2=\b\19\a=\a\20\0069\a\21\0009\a\22\a9\a\23\a5\t\25\0009\n\21\0009\n\24\n)\f¸ˇB\n\2\2=\n\26\t9\n\21\0009\n\24\n)\f\4\0B\n\2\2=\n\27\t9\n\21\0009\n\28\nB\n\1\2=\n\29\t9\n\21\0009\n\30\nB\n\1\2=\n\31\t9\n\21\0003\f \0005\r!\0B\n\3\2=\n\"\t9\n\21\0003\f#\0005\r$\0B\n\3\2=\n%\t9\n\21\0009\n&\n5\f'\0B\n\2\2=\n(\tB\a\2\2=\a\21\0064\a\6\0005\b)\0>\b\1\a5\b*\0>\b\2\a5\b+\0>\b\3\a5\b,\0>\b\4\a5\b-\0>\b\5\a=\a.\6B\4\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\forgmode\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\tmenu\1\0\3\rnvim_lsp\n[LSP]\15dictionary\v[Dict]\vbuffer\n[Buf]\1\0\2\14with_text\1\rmaxwidth\0032\15cmp_format\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\flspkind\bcmp\frequire#menu,menuone,noselect,noinsert\16completeopt\bvim\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nÉ\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\b\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\1\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimÀ\5\1\2\14\0\24\0P3\2\0\0003\3\1\0005\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\0013\5\f\0003\6\r\0005\a\14\0\18\b\5\0'\n\3\0'\v\4\0'\f\5\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\6\0'\f\a\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\b\0'\f\t\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\n\0'\f\v\0\18\r\a\0B\b\5\0019\b\15\0009\b\16\b\15\0\b\0X\t\20Ä6\b\17\0009\b\18\b9\b\19\b'\n\20\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\21\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\22\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\23\0B\b\2\0012\0\0ÄK\0\1\0\16augroup ENDGautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities\1\0\2\fnoremap\2\vsilent\2\0\0.<cmd>lua vim.lsp.buf.implementation()<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0\0A\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim∏\2\1\2\v\0\f\0\0293\2\0\0003\3\1\0005\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0.<cmd>lua vim.lsp.buf.implementation()<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0\0§\f\1\0\17\0U\0°\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0003\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4B\4\1\0029\5\t\0049\5\n\0059\5\v\5+\6\2\0=\6\f\0059\5\r\0009\5\14\0055\a\15\0=\3\16\a=\4\17\a5\b\18\0=\b\19\aB\5\2\0019\5\20\0009\5\14\0055\a\21\0=\3\16\a5\b\22\0=\b\23\a5\b\25\0005\t\24\0=\t\26\b=\b\27\aB\5\2\0019\5\28\0009\5\14\0055\a\29\0=\3\16\a5\b)\0005\t!\0005\n\31\0005\v\30\0=\v \n=\n\"\t5\n&\0006\v\5\0009\v#\v9\v$\v'\r%\0+\14\2\0B\v\3\2=\v'\n=\n(\t=\t*\b=\b\27\aB\5\2\0016\5\0\0'\a\1\0B\5\2\0029\5+\0059\5\14\0055\a,\0=\3\16\a=\4\17\aB\5\2\0019\5-\0009\5\14\0055\a.\0=\3\16\a5\b/\0=\b\19\a=\4\17\aB\5\2\0016\5\0\0'\a\1\0B\5\2\0029\0050\0059\5\14\0054\a\0\0B\5\2\0016\5\0\0'\a\1\0B\5\2\0029\0061\0009\6\14\0065\b2\0=\3\16\b=\4\17\b5\t4\0005\n3\0=\n\23\t5\n5\0=\n\19\t9\n6\0059\n7\n'\f8\0'\r9\0B\n\3\2=\n:\t=\t;\bB\6\2\0019\6<\0009\6\14\0065\b=\0=\3\16\b=\4\17\bB\6\2\0019\6>\0009\6\14\0065\b?\0=\3\16\bB\6\2\0019\6@\0009\6\14\0065\bA\0=\3\16\bB\6\2\0019\6B\0009\6\14\0065\bC\0=\3\16\b5\tD\0=\t\19\bB\6\2\0015\6E\0006\aF\0\18\t\6\0B\a\2\4H\n\vÄ'\fG\0\18\r\n\0&\f\r\f6\r\5\0009\rH\r9\rI\r\18\15\f\0005\16J\0=\vK\16=\fL\16B\r\3\1F\n\3\3R\nÛ\1276\a\5\0009\a\6\a9\aM\a6\b\5\0009\b\6\b9\bO\b6\n\5\0009\n\6\n9\nP\n9\nQ\n5\vR\0005\fS\0=\fT\vB\b\3\2=\bN\aK\0\1\0\17virtual_text\1\0\2\fspacing\3\4\vprefix\b‚óè\1\0\1\21update_in_insert\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \1\6\0\0\15typescript\20typescriptreact\19typescript.tsx\19typescript.jsx\15javascript\1\0\0\rtsserver\1\0\0\vbashls\1\0\0\16tailwindcss\1\0\0\18rust_analyzer\19default_config\rroot_dir\t.git\17package.json\17root_pattern\tutil\1\2\0\0\rsolidity\1\0\0\1\3\0\0\16solidity-ls\f--stdio\1\0\0\16solidity_ls\vsolang\1\4\0\0\thtml\bjsp\bejs\1\0\0\thtml\1\0\0\rprismals\bLua\1\0\0\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\rsettings\ranalyses\1\0\1\16staticcheck\2\1\0\1\17unusedparams\2\bcmd\1\3\0\0\ngopls\nserve\1\0\0\ngopls\14filetypes\1\3\0\0\bcss\tscss\17capabilities\14on_attach\1\0\0\nsetup\ncssls\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0\0\21vim.lsp.protocol\14lspconfig\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-transparent"] = {
    config = { "\27LJ\2\n¯\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\fexclude\17extra_groups\1\b\0\0\23BufferLineTabClose\29BufferlineBufferSelected\19BufferLineFill\25BufferLineBackground\vNeotre\24BufferLineSeparator BufferLineIndicatorSelected\1\0\1\venable\2\nsetup\16transparent\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-transparent",
    url = "https://github.com/xiyaowong/nvim-transparent"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nÖ\3\0\0\5\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0004\4\0\0=\4\5\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0026\1\0\0'\3\14\0B\1\2\0029\1\15\1B\1\1\0029\2\16\0015\3\18\0=\3\17\2K\0\1\0\1\3\0\0\15javascript\19typescript.tsx\27filetype_to_parsername\btsx\23get_parser_configs\28nvim-treesitter.parsers\fautotag\1\0\1\venable\2\21ensure_installed\1\a\0\0\vprisma\15javascript\blua\btsx\ago\borg\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\2\0\0\rsolidity\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n˛\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\5\0\0\rneo-tree\19neo-tree-popup\vnotify\rquickfix\1\0\3\20include_current\1\19autoselect_one\2\23other_win_hl_color\f#f3a14e\nsetup\18window-picker\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["org-bullets.nvim"] = {
    config = { "\27LJ\2\nÖ\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fsymbols\15checkboxes\ttodo\1\3\0\0\aÀü\fOrgTODO\tdone\1\3\0\0\b‚úì\fOrgDone\thalf\1\0\0\1\3\0\0\bÔá∏\29OrgTSCheckboxHalfChecked\14headlines\1\0\0\1\5\0\0\b‚óâ\b‚úø\b‚óã\b‚ú∏\1\0\1\18concealcursor\2\nsetup\16org-bullets\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/org-bullets.nvim",
    url = "https://github.com/akinsho/org-bullets.nvim"
  },
  orgmode = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÓ\v\0\0\t\0:\0c6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\0034\0005\4\t\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\f\0046\5\0\0'\a\r\0B\5\2\0029\5\14\5=\5\15\0044\5\0\0=\5\16\0046\5\0\0'\a\r\0B\5\2\0029\5\17\5=\5\18\0044\5\0\0=\5\19\0044\5\0\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0046\5\0\0'\a\25\0B\5\2\0029\5\26\0059\5\27\5=\5\28\0046\5\0\0'\a\25\0B\5\2\0029\5\29\0059\5\27\5=\5\30\0046\5\0\0'\a\25\0B\5\2\0029\5\31\0059\5\27\5=\5 \0046\5\0\0'\a\25\0B\5\2\0029\5!\5=\5!\0045\5/\0005\6#\0009\a\"\0=\a$\0069\a%\0=\a&\0069\a'\0009\b(\0 \a\b\a=\a)\0069\a*\0=\a+\0069\a,\0009\b-\0 \a\b\a=\a.\6=\0060\0055\0061\0009\a\"\0=\a$\0069\a%\0=\a&\0069\a'\0009\b(\0 \a\b\a=\a)\6=\0062\5=\0053\4=\0045\3B\1\2\0016\0016\0009\0017\1'\0038\0B\1\2\0016\0016\0009\0017\1'\0039\0B\1\2\1K\0\1\0Pnnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>Pnnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>\bcmd\bvim\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\t<CR>\vcenter\19select_default\n<esc>\nclose\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\17find_command\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\18layout_config\1\0\n\rwinblend\3\0\17entry_prefix\a  \18prompt_prefix\tÔ°à \20layout_strategy\15horizontal\21sorting_strategy\15descending\23selection_strategy\nreset\17initial_mode\vinsert\20selection_caret\tÔÅ§ \ruse_less\2\19color_devicons\2\rvertical\1\0\1\vmirror\1\15horizontal\1\0\1\vmirror\1\1\0\3\nwidth\4\0ÄÄ†ˇ\3\19preview_cutoff\3x\20prompt_position\vbottom\nsetup\14telescope\22telescope.actions\frequire\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-closetag"] = {
    config = { "\27LJ\2\nm\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Nlet g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ejs,*.js,*.rs'\bcmd\bvim\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/vim-closetag",
    url = "https://github.com/alvan/vim-closetag"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\n‚\1\0\0\2\0\n\2\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0*\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\n<C-\\>\27floaterm_keymap_toggle\20floaterm_height\19floaterm_width\16bottomright\22floaterm_position\nfloat\21floaterm_wintype\6g\bvimÁÃô≥\6≥Êåˇ\3\1ÄÄÄˇ\3\0" },
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/thangphan/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n˛\1\0\0\6\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17filter_rules\abo\1\0\0\fbuftype\1\2\0\0\rterminal\rfiletype\1\0\0\1\5\0\0\rneo-tree\19neo-tree-popup\vnotify\rquickfix\1\0\3\20include_current\1\19autoselect_one\2\23other_win_hl_color\f#f3a14e\nsetup\18window-picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: cmp_luasnip
time([[Config for cmp_luasnip]], true)
try_loadstring("\27LJ\2\nG\0\0\2\1\2\0\t-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\3Ä-\0\0\0009\0\1\0B\0\1\1K\0\1\0\0¿\vexpand\23expand_or_jumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2\1\0B\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\tjump\rjumpableC\0\0\3\1\2\0\v-\0\0\0009\0\0\0)\2ˇˇB\0\2\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\tjump\rjumpableM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2\1\0B\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeM\0\0\3\1\2\0\n-\0\0\0009\0\0\0B\0\1\2\15\0\0\0X\1\4Ä-\0\0\0009\0\1\0)\2ˇˇB\0\2\1K\0\1\0\0¿\18change_choice\18choice_activeﬁ\4\1\0\n\0\"\0@6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0B\1\2\0019\1\5\0009\1\6\0015\3\a\0004\4\0\b6\5\0\0'\a\b\0B\5\2\0029\5\t\0055\6\r\0005\a\v\0004\b\3\0005\t\n\0>\t\1\b=\b\f\a=\a\14\6<\6\5\4=\4\15\3B\1\2\0016\1\16\0009\1\17\0019\1\18\0015\3\19\0'\4\20\0003\5\21\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\22\0'\4\23\0003\5\24\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\25\0'\4\26\0003\5\27\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\28\0'\4\29\0003\5\30\0B\1\4\0016\1\16\0009\1\17\0019\1\18\0015\3\31\0'\4 \0003\5!\0B\1\4\0012\0\0ÄK\0\1\0\0\n<a-h>\1\3\0\0\6i\6s\0\n<c-c>\1\3\0\0\6i\6s\0\n<c-k>\1\3\0\0\6i\6s\0\n<c-j>\1\3\0\0\6i\6s\0\n<a-p>\1\3\0\0\6i\6s\bset\vkeymap\bvim\rext_opts\vactive\1\0\0\14virt_text\1\0\0\1\3\0\0\b‚óè\18GruvboxOrange\15choiceNode\23luasnip.util.types\1\0\3\fhistory\2\24enable_autosnippets\2\17updateevents\29TextChanged,TextChangedI\15set_config\vconfig\1\0\1\npaths\29~/.config/nvim/snippets/\tload\29luasnip.loaders.from_lua\fluasnip\frequire\0", "config", "cmp_luasnip")
time([[Config for cmp_luasnip]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n–\1\0\0\b\0\b\2!6\0\0\0006\2\1\0009\2\2\0029\2\3\2)\4\0\0B\2\2\0A\0\0\3\b\1\0\0X\2\20Ä6\2\1\0009\2\2\0029\2\4\2)\4\0\0\23\5\1\0\18\6\0\0+\a\2\0B\2\5\2:\2\1\2\18\4\2\0009\2\5\2\18\5\1\0\18\6\1\0B\2\4\2\18\4\2\0009\2\6\2'\5\a\0B\2\3\2\n\2\0\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\a%s\nmatch\bsub\23nvim_buf_get_lines\24nvim_win_get_cursor\bapi\bvim\vunpack\0\2\v\0\1\1\0\0\0\1K\0\1\0}\0\1\3\2\3\0\20-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\nÄ-\1\1\0B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\2\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\3¿\rcomplete\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisibleí\6\1\0\14\0/\0Q6\0\0\0'\1\2\0=\1\1\0006\0\3\0'\2\4\0B\0\2\0026\1\3\0'\3\5\0B\1\2\0026\2\3\0'\4\6\0B\2\2\0023\3\a\0009\4\b\0005\6\f\0005\a\n\0003\b\t\0=\b\v\a=\a\r\0065\a\18\0009\b\14\0015\n\15\0005\v\16\0=\v\17\nB\b\2\2=\b\19\a=\a\20\0069\a\21\0009\a\22\a9\a\23\a5\t\25\0009\n\21\0009\n\24\n)\f¸ˇB\n\2\2=\n\26\t9\n\21\0009\n\24\n)\f\4\0B\n\2\2=\n\27\t9\n\21\0009\n\28\nB\n\1\2=\n\29\t9\n\21\0009\n\30\nB\n\1\2=\n\31\t9\n\21\0003\f \0005\r!\0B\n\3\2=\n\"\t9\n\21\0003\f#\0005\r$\0B\n\3\2=\n%\t9\n\21\0009\n&\n5\f'\0B\n\2\2=\n(\tB\a\2\2=\a\21\0064\a\6\0005\b)\0>\b\1\a5\b*\0>\b\2\a5\b+\0>\b\3\a5\b,\0>\b\4\a5\b-\0>\b\5\a=\a.\6B\4\2\0012\0\0ÄK\0\1\0\fsources\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\forgmode\1\0\1\tname\rnvim_lsp\t<CR>\1\0\1\vselect\2\fconfirm\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\15formatting\vformat\1\0\0\tmenu\1\0\3\rnvim_lsp\n[LSP]\15dictionary\v[Dict]\vbuffer\n[Buf]\1\0\2\14with_text\1\rmaxwidth\0032\15cmp_format\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\0\fluasnip\flspkind\bcmp\frequire#menu,menuone,noselect,noinsert\16completeopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: org-bullets.nvim
time([[Config for org-bullets.nvim]], true)
try_loadstring("\27LJ\2\nÖ\2\0\0\6\0\16\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\b\0005\5\a\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0=\5\r\4=\4\14\3=\3\15\2B\0\2\1K\0\1\0\fsymbols\15checkboxes\ttodo\1\3\0\0\aÀü\fOrgTODO\tdone\1\3\0\0\b‚úì\fOrgDone\thalf\1\0\0\1\3\0\0\bÔá∏\29OrgTSCheckboxHalfChecked\14headlines\1\0\0\1\5\0\0\b‚óâ\b‚úø\b‚óã\b‚ú∏\1\0\1\18concealcursor\2\nsetup\16org-bullets\frequire\0", "config", "org-bullets.nvim")
time([[Config for org-bullets.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nÉ\1\0\0\4\0\5\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0B\0\3\1K\0\1\0\1\0\b\vcss_fn\2\bcss\2\vhsl_fn\2\vrgb_fn\2\rRRGGBBAA\2\nnames\1\vRRGGBB\2\bRGB\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\ná\1\0\0\5\0\6\0\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\2>\2\2\1=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\4\0\0\22--stdin-file-path\0\f--write\1\0\2\nstdin\2\bexe\16rome formatÄ\1\0\0\5\0\6\1\n5\0\0\0005\1\1\0006\2\2\0009\2\3\0029\2\4\2)\4\0\0B\2\2\0?\2\0\0=\1\5\0L\0\2\0\targs\22nvim_buf_get_name\bapi\bvim\1\2\0\0\21--stdin-filepath\1\0\2\nstdin\2\bexe\rprettier\5ÄÄ¿ô\4#\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\2\bexe\ngofmt(\0\0\1\0\1\0\0025\0\0\0L\0\2\0\1\0\2\nstdin\2\bexe\15lua-formatô\5\1\0\t\0\29\0@6\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0+\6\2\0B\3\3\0019\3\b\0005\5\t\0005\6\n\0004\a\3\0>\2\1\a=\a\v\0064\a\3\0>\2\1\a=\a\f\0064\a\3\0>\2\1\a=\a\r\0064\a\3\0>\2\1\a=\a\14\0064\a\3\0>\2\1\a=\a\15\0064\a\3\0>\2\1\a=\a\16\0064\a\3\0>\2\1\a=\a\17\0064\a\3\0>\2\1\a=\a\18\0064\a\3\0>\2\1\a=\a\19\0064\a\3\0>\2\1\a=\a\20\0064\a\3\0>\2\1\a=\a\21\0064\a\3\0>\2\1\a=\a\22\0064\a\3\0>\2\1\a=\a\23\0064\a\3\0003\b\24\0>\b\1\a=\a\25\0064\a\3\0003\b\26\0>\b\1\a=\a\27\6=\6\28\5B\3\2\1K\0\1\0\rfiletype\blua\0\ago\0\ash\rmarkdown\tyaml\tscss\tjson\bvue\bcss\vsvelte\thtml\15javascript\15typescript\20typescriptreact\20javascriptreact\1\0\0\1\0\1\flogging\1\nsetup„\1        augroup FormatAutogroup\n          autocmd!\n          autocmd BufWritePost *.js,*.mjs,*.ts,*.lua,*.jsx,*.tsx,*.md,*.mdx,*.yml,*.json,*.css,*.scss,*.html,*.vue,*.svelte,*.sol,*.go FormatWrite\n        augroup END\n    \14nvim_exec\bapi\bvim\0\0\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: everforest
time([[Config for everforest]], true)
try_loadstring("\27LJ\2\nö\2\0\0\4\0\v\0\0276\0\0\0009\0\1\0\18\1\0\0'\3\2\0B\1\2\0016\1\0\0009\1\3\1'\2\5\0=\2\4\0016\1\0\0009\1\3\1)\2\1\0=\2\6\0016\1\0\0009\1\3\1)\2\0\0=\2\a\1\18\1\0\0'\3\b\0B\1\2\1\18\1\0\0'\3\t\0B\1\2\1\18\1\0\0'\3\n\0B\1\2\1K\0\1\0\27colorscheme everforest\22set termguicolors\24set background=dark&everforest_disable_italic_comment\29everforest_enable_italic\tdark\26everforest_background\6g\14syntax on\bcmd\bvim\0", "config", "everforest")
time([[Config for everforest]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvimÀ\5\1\2\14\0\24\0P3\2\0\0003\3\1\0005\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\0013\5\f\0003\6\r\0005\a\14\0\18\b\5\0'\n\3\0'\v\4\0'\f\5\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\6\0'\f\a\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\b\0'\f\t\0\18\r\a\0B\b\5\1\18\b\5\0'\n\3\0'\v\n\0'\f\v\0\18\r\a\0B\b\5\0019\b\15\0009\b\16\b\15\0\b\0X\t\20Ä6\b\17\0009\b\18\b9\b\19\b'\n\20\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\21\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\22\0B\b\2\0016\b\17\0009\b\18\b9\b\19\b'\n\23\0B\b\2\0012\0\0ÄK\0\1\0\16augroup ENDGautocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities\1\0\2\fnoremap\2\vsilent\2\0\0.<cmd>lua vim.lsp.buf.implementation()<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0\0A\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_keymap\bapi\bvimA\2\0\4\1\3\0\a6\0\0\0009\0\1\0009\0\2\0-\2\0\0G\3\0\0A\0\1\1K\0\1\0\1¿\24nvim_buf_set_option\bapi\bvim∏\2\1\2\v\0\f\0\0293\2\0\0003\3\1\0005\4\2\0\18\5\2\0'\a\3\0'\b\4\0'\t\5\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\6\0'\t\a\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\b\0'\t\t\0\18\n\4\0B\5\5\1\18\5\2\0'\a\3\0'\b\n\0'\t\v\0\18\n\4\0B\5\5\0012\0\0ÄK\0\1\0.<cmd>lua vim.lsp.buf.implementation()<CR>\agi&<cmd>lua vim.lsp.buf.rename()<CR>\14<space>rn%<Cmd>lua vim.lsp.buf.hover()<CR>\6K*<Cmd>lua vim.lsp.buf.definition()<CR>\agd\6n\1\0\2\fnoremap\2\vsilent\2\0\0§\f\1\0\17\0U\0°\0016\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0023\2\3\0003\3\4\0006\4\5\0009\4\6\0049\4\a\0049\4\b\4B\4\1\0029\5\t\0049\5\n\0059\5\v\5+\6\2\0=\6\f\0059\5\r\0009\5\14\0055\a\15\0=\3\16\a=\4\17\a5\b\18\0=\b\19\aB\5\2\0019\5\20\0009\5\14\0055\a\21\0=\3\16\a5\b\22\0=\b\23\a5\b\25\0005\t\24\0=\t\26\b=\b\27\aB\5\2\0019\5\28\0009\5\14\0055\a\29\0=\3\16\a5\b)\0005\t!\0005\n\31\0005\v\30\0=\v \n=\n\"\t5\n&\0006\v\5\0009\v#\v9\v$\v'\r%\0+\14\2\0B\v\3\2=\v'\n=\n(\t=\t*\b=\b\27\aB\5\2\0016\5\0\0'\a\1\0B\5\2\0029\5+\0059\5\14\0055\a,\0=\3\16\a=\4\17\aB\5\2\0019\5-\0009\5\14\0055\a.\0=\3\16\a5\b/\0=\b\19\a=\4\17\aB\5\2\0016\5\0\0'\a\1\0B\5\2\0029\0050\0059\5\14\0054\a\0\0B\5\2\0016\5\0\0'\a\1\0B\5\2\0029\0061\0009\6\14\0065\b2\0=\3\16\b=\4\17\b5\t4\0005\n3\0=\n\23\t5\n5\0=\n\19\t9\n6\0059\n7\n'\f8\0'\r9\0B\n\3\2=\n:\t=\t;\bB\6\2\0019\6<\0009\6\14\0065\b=\0=\3\16\b=\4\17\bB\6\2\0019\6>\0009\6\14\0065\b?\0=\3\16\bB\6\2\0019\6@\0009\6\14\0065\bA\0=\3\16\bB\6\2\0019\6B\0009\6\14\0065\bC\0=\3\16\b5\tD\0=\t\19\bB\6\2\0015\6E\0006\aF\0\18\t\6\0B\a\2\4H\n\vÄ'\fG\0\18\r\n\0&\f\r\f6\r\5\0009\rH\r9\rI\r\18\15\f\0005\16J\0=\vK\16=\fL\16B\r\3\1F\n\3\3R\nÛ\1276\a\5\0009\a\6\a9\aM\a6\b\5\0009\b\6\b9\bO\b6\n\5\0009\n\6\n9\nP\n9\nQ\n5\vR\0005\fS\0=\fT\vB\b\3\2=\bN\aK\0\1\0\17virtual_text\1\0\2\fspacing\3\4\vprefix\b‚óè\1\0\1\21update_in_insert\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\vtexthl\ttext\1\0\1\nnumhl\5\16sign_define\afn\19DiagnosticSign\npairs\1\0\4\tHint\tÔ†µ \tWarn\tÔî© \tInfo\tÔëâ \nError\tÔôô \1\6\0\0\15typescript\20typescriptreact\19typescript.tsx\19typescript.jsx\15javascript\1\0\0\rtsserver\1\0\0\vbashls\1\0\0\16tailwindcss\1\0\0\18rust_analyzer\19default_config\rroot_dir\t.git\17package.json\17root_pattern\tutil\1\2\0\0\rsolidity\1\0\0\1\3\0\0\16solidity-ls\f--stdio\1\0\0\16solidity_ls\vsolang\1\4\0\0\thtml\bjsp\bejs\1\0\0\thtml\1\0\0\rprismals\bLua\1\0\0\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\1\0\0\fglobals\1\0\0\1\2\0\0\bvim\1\0\0\16sumneko_lua\rsettings\ranalyses\1\0\1\16staticcheck\2\1\0\1\17unusedparams\2\bcmd\1\3\0\0\ngopls\nserve\1\0\0\ngopls\14filetypes\1\3\0\0\bcss\tscss\17capabilities\14on_attach\1\0\0\nsetup\ncssls\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim\0\0\21vim.lsp.protocol\14lspconfig\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-transparent
time([[Config for nvim-transparent]], true)
try_loadstring("\27LJ\2\n¯\1\0\0\4\0\a\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\2B\0\2\1K\0\1\0\fexclude\17extra_groups\1\b\0\0\23BufferLineTabClose\29BufferlineBufferSelected\19BufferLineFill\25BufferLineBackground\vNeotre\24BufferLineSeparator BufferLineIndicatorSelected\1\0\1\venable\2\nsetup\16transparent\frequire\0", "config", "nvim-transparent")
time([[Config for nvim-transparent]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\nº\5\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\25\vMethod\19 Ôö¶  (Method)\tFile\17 Ôúì  (File)\tText\18 Ôíû  (Text) \14Reference\22 Ôúú  (Reference)\nColor\18 Ô£ó  (Color)\vFolder\19 Ôùä  (Folder)\fSnippet\20 ÔÉÑ  (Snippet)\15EnumMember\23 ÔÖù  (EnumMember)\fKeyword\20 Ô†ä  (Keyword)\rConstant\21 Ô≤Ä  (Constant)\tEnum\16 Ô©ó (Enum)\vStruct\19 Ô≥§  (Struct)\nValue\18 Ô¢ü  (Value)\nEvent\18 ÔÉß  (Event)\tUnit\17 Ôëµ  (Unit)\rOperator\21 Ôó´  (Operator)\rProperty\20 Ô™∂ (Property)\18TypeParameter\26 ÔûÉ  (TypeParameter)\vModule\19 Ôô®  (Module)\14Interface\22 Ô∞Æ  (Interface)\nClass\18 Ô†ñ  (Class)\rVariable\21[Óúñ] (Variable)\nField\18 Ô∞†  (Field)\16Constructor\24 Ôê•  (Constructor)\rFunction\21 Ôûî  (Function)\1\0\2\vpreset\rcodicons\tmode\vsymbol\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÓ\v\0\0\t\0:\0c6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\0034\0005\4\t\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\5=\5\n\0045\5\v\0=\5\f\0046\5\0\0'\a\r\0B\5\2\0029\5\14\5=\5\15\0044\5\0\0=\5\16\0046\5\0\0'\a\r\0B\5\2\0029\5\17\5=\5\18\0044\5\0\0=\5\19\0044\5\0\0=\5\20\0045\5\21\0=\5\22\0045\5\23\0=\5\24\0046\5\0\0'\a\25\0B\5\2\0029\5\26\0059\5\27\5=\5\28\0046\5\0\0'\a\25\0B\5\2\0029\5\29\0059\5\27\5=\5\30\0046\5\0\0'\a\25\0B\5\2\0029\5\31\0059\5\27\5=\5 \0046\5\0\0'\a\25\0B\5\2\0029\5!\5=\5!\0045\5/\0005\6#\0009\a\"\0=\a$\0069\a%\0=\a&\0069\a'\0009\b(\0 \a\b\a=\a)\0069\a*\0=\a+\0069\a,\0009\b-\0 \a\b\a=\a.\6=\0060\0055\0061\0009\a\"\0=\a$\0069\a%\0=\a&\0069\a'\0009\b(\0 \a\b\a=\a)\6=\0062\5=\0053\4=\0045\3B\1\2\0016\0016\0009\0017\1'\0038\0B\1\2\0016\0016\0009\0017\1'\0039\0B\1\2\1K\0\1\0Pnnoremap  <silent> ;r <cmd>lua require('telescope.builtin').live_grep()<cr>Pnnoremap <silent> ;f <cmd>lua require('telescope.builtin').find_files()<cr>\bcmd\bvim\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\t<CR>\vcenter\19select_default\n<esc>\nclose\n<C-q>\16open_qflist\25smart_send_to_qflist\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\17path_display\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\17find_command\1\a\0\0\arg\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\18layout_config\1\0\n\rwinblend\3\0\17entry_prefix\a  \18prompt_prefix\tÔ°à \20layout_strategy\15horizontal\21sorting_strategy\15descending\23selection_strategy\nreset\17initial_mode\vinsert\20selection_caret\tÔÅ§ \ruse_less\2\19color_devicons\2\rvertical\1\0\1\vmirror\1\15horizontal\1\0\1\vmirror\1\1\0\3\nwidth\4\0ÄÄ†ˇ\3\19preview_cutoff\3x\20prompt_position\vbottom\nsetup\14telescope\22telescope.actions\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n—\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\20buftype_exclude\1\3\0\0\rterminal\vnofile\21filetype_exclude\1\5\0\0\thelp\btxt\tnorg\amd\1\0\2\31show_current_context_start\2\25show_current_context\1\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nÖ\3\0\0\5\0\19\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0004\4\0\0=\4\5\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\0026\1\0\0'\3\14\0B\1\2\0029\1\15\1B\1\1\0029\2\16\0015\3\18\0=\3\17\2K\0\1\0\1\3\0\0\15javascript\19typescript.tsx\27filetype_to_parsername\btsx\23get_parser_configs\28nvim-treesitter.parsers\fautotag\1\0\1\venable\2\21ensure_installed\1\a\0\0\vprisma\15javascript\blua\btsx\ago\borg\vindent\1\0\1\venable\2\14highlight\1\0\0\fdisable\1\2\0\0\rsolidity\1\0\1\venable\2\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\ní\1\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\0\6\28icon_separator_inactive\5\26icon_separator_active\5\19icon_close_tab\bÔôò\14clickable\2\rtabpages\2\14animation\2\15bufferline\6g\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: vim-closetag
time([[Config for vim-closetag]], true)
try_loadstring("\27LJ\2\nm\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0Nlet g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php,*.ejs,*.js,*.rs'\bcmd\bvim\0", "config", "vim-closetag")
time([[Config for vim-closetag]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n˛\5\0\0\a\0%\00096\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\t\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\0034\4\0\0=\4\b\3=\3\n\0025\3\f\0005\4\v\0=\4\r\0035\4\14\0=\4\15\0034\4\3\0005\5\16\0>\5\1\4=\4\17\0035\4\23\0005\5\19\0005\6\18\0=\6\20\0055\6\21\0=\6\22\5>\5\1\4=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\3=\3\29\0025\3\30\0004\4\0\0=\4\r\0034\4\0\0=\4\15\0034\4\3\0005\5\31\0>\5\1\4=\4\17\0035\4 \0=\4\24\0034\4\0\0=\4\26\0034\4\0\0=\4\28\3=\3!\0024\3\0\0=\3\"\0025\3#\0=\3$\2B\0\2\1K\0\1\0\15extensions\1\2\0\0\rfugitive\ftabline\22inactive_sections\1\2\0\0\rlocation\1\2\2\0\rfilename\16file_status\2\tpath\3\1\1\0\0\rsections\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\4\0\0\0\rencoding\rfiletype\fsources\1\2\0\0\20nvim_diagnostic\fsymbols\1\2\0\0\16diagnostics\1\0\4\tinfo\tÔëâ \twarn\tÔÅ± \nerror\tÔÜà \thint\tÔÉ´ \14lualine_c\1\2\2\0\rfilename\16file_status\2\tpath\3\0\14lualine_b\1\2\0\0\vbranch\14lualine_a\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\25component_separators\1\0\2\tleft\5\nright\bÓÇ≥\23section_separators\1\0\2\tleft\5\nright\5\1\0\2\ntheme\15everforest\18icons_enabled\2\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nû\17\0\0\a\0008\0M6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\4=\4\21\3=\3\22\0025\3\23\0005\4\24\0=\4\25\0035\4\27\0005\5\26\0=\5\28\0045\5\29\0005\6\30\0=\6\31\5=\5 \4=\4!\3=\3\"\0024\3\0\0=\3#\0025\3(\0005\4$\0004\5\0\0=\5%\0044\5\0\0=\5&\0044\5\0\0=\5'\4=\4)\0036\4*\0=\4+\0035\4-\0005\5,\0=\5!\4=\4\"\3=\3.\0025\3/\0005\0041\0005\0050\0=\5!\4=\4\"\3=\0032\0025\0035\0005\0043\0005\0054\0=\5!\4=\4\"\3=\3\21\2B\0\2\0016\0\0\0009\0\1\0'\0026\0B\0\2\0016\0\0\0009\0\1\0'\0027\0B\0\2\1K\0\1\0'nnoremap <c-b> :Neotree toggle<cr>'nnoremap <c-f> :Neotree reveal<cr>\1\0\0\1\0\a\agc\15git_commit\agr\20git_revert_file\agp\rgit_push\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\6A\16git_add_all\1\0\1\rposition\nfloat\fbuffers\1\0\0\1\0\3\t<bs>\16navigate_up\6.\rset_root\abd\18buffer_delete\1\0\3\21group_empty_dirs\2\24follow_current_file\2\18show_unloaded\2\15filesystem\1\0\0\1\0\t\6H\18toggle_hidden\6C\rset_root\6U\16navigate_up\a]g\22next_git_modified\a[g\22prev_git_modified\n<c-x>\17clear_filter\6D\27fuzzy_finder_directory\6/\17fuzzy_finder\6f\21filter_on_submit\27use_libuv_file_watcher\btru\19filtered_items\1\0\3\26hijack_netrw_behavior\17open_current\21group_empty_dirs\1\24follow_current_file\2\15never_show\20hide_by_pattern\17hide_by_name\1\0\4\18hide_dotfiles\2\fvisible\1\16hide_hidden\2\20hide_gitignored\2\18nesting_rules\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\0\15\6r\vrename\6o\topen\6R\frefresh\6S\15open_split\6p\25paste_from_clipboard\6d\vdelete\t<cr>\topen\18<2-LeftMouse>\topen\6q\17close_window\6z\15close_node\6K\18add_directory\6?\14show_help\6c\22copy_to_clipboard\6s\16open_vsplit\6m\21cut_to_clipboard\1\2\1\0\16toggle_node\vnowait\1\20mapping_options\1\0\2\fnoremap\2\vnowait\2\1\0\2\nwidth\3(\rposition\tleft\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\runstaged\bÔò∞\rmodified\5\fignored\bÔë¥\14untracked\bÔÑ®\frenamed\bÔïî\fdeleted\b‚úñ\nadded\5\rconflict\bÓúß\vstaged\bÔÅÜ\tname\1\0\3\26use_git_status_colors\2\19trailing_slash\1\14highlight\20NeoTreeFileName\rmodified\1\0\2\14highlight\20NeoTreeModified\vsymbol\b[+]\ticon\1\0\5\fdefault\6*\14highlight\20NeoTreeFileIcon\17folder_empty\bÔ∞ä\16folder_open\bÓóæ\18folder_closed\bÓóø\vindent\1\0\t\14highlight\24NeoTreeIndentMarker\23last_indent_marker\b‚îî\18indent_marker\b‚îÇ\17with_markers\2\fpadding\3\1\16indent_size\3\2\23expander_highlight\20NeoTreeExpander\22expander_expanded\bÔëº\23expander_collapsed\bÔë†\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\5\26sort_case_insensitive\1\23enable_diagnostics\1\22enable_git_status\1\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire0 let g:neo_tree_remove_legacy_commands = 1 \bcmd\bvim\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\2\0\n\2\0216\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0*\1\0\0=\1\6\0006\0\0\0009\0\1\0*\1\1\0=\1\a\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0K\0\1\0\n<C-\\>\27floaterm_keymap_toggle\20floaterm_height\19floaterm_width\16bottomright\22floaterm_position\nfloat\21floaterm_wintype\6g\bvimÁÃô≥\6≥Êåˇ\3\1ÄÄÄˇ\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n'\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\2K\0\1\0\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
