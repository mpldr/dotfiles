-- highlight column 80
vim.wo.colorcolumn = '80'

-- make space the leader key
vim.g.mapleader = ' '

-- tab bindings are atrocious
vim.api.nvim_set_keymap("n", "tr", ":bp<CR>", {})
vim.api.nvim_set_keymap("n", "tz", ":bn<CR>", {})
vim.api.nvim_set_keymap("n", "tc", ":bd<CR>", {})
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", {})

-- clear highlights on enter and escape
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR>", {silent = true})

-- always show 2 lines around the cursor
vim.opt.scrolloff = 2

-- don't expand cache or temporary paths
vim.opt.wildignore = {'*/cache/*', '*/tmp/*'}

-- show line numbers
vim.opt.number = true

-- syntax highlighting… we aren't savages
vim.opt.syntax = "enable"

-- make :find actually find things
vim.opt.path = vim.opt.path + ",**"

-- disable mouse
vim.opt.mouse = ""

-- sane indentation settings
vim.opt.autoindent = true
vim.opt.shiftwidth = 8
vim.opt.softtabstop = 8
vim.opt.tabstop = 8
vim.opt.expandtab = false

-- wrapping at whitespace
vim.opt.lbr = true
vim.opt.breakindent = true
vim.opt.formatoptions = "tcrqn1j"

-- unmap space and reassign as <leader>
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- map quickfix stuff to <leader>c
vim.api.nvim_set_keymap('n', '<leader>cc', ':cw<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cg', ':.cc<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cn', ':cn<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cp', ':cp<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<s-up>', ':wincmd k<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-down>', ':wincmd j<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-left>', ':wincmd h<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-right>', ':wincmd l<cr>', { noremap = true, silent = true })

-- TODO: find alternative
-- vim.keymap.set('n', 'gb', ':call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand("%:p")), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>')

-- strings used in list mode
-- vim.opt.listchars = 'eol:↲,tab:→,trail:·,extends:▶,precedes:◀'

require('plugins')
require('plugin_theme')
require('plugin_completion') -- also for snippets
require('go')

-- ALE use quickfix window
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1
