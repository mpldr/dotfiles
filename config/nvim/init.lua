-- highlight column 80
vim.wo.colorcolumn = '80'

-- make space the leader key
vim.g.mapleader = ' '

-- tab bindings are atrocious
vim.api.nvim_set_keymap("n", "tr", ":bp<CR>", {})
vim.api.nvim_set_keymap("n", "tz", ":bn<CR>", {})
vim.api.nvim_set_keymap("n", "tc", ":bd<CR>", {})
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", {})

-- disable those useless shits
vim.api.nvim_set_keymap("n", "<PageUp>", "<nop>", {})
vim.api.nvim_set_keymap("n", "<PageDown>", "<nop>", {})

-- clear highlights on enter and escape
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "<CR>", ":noh<CR>", {silent = true})

-- completion-menu
vim.opt.wildmode = "longest,list,full"
vim.opt.completeopt = "longest,menuone"

-- auto-load changes
vim.opt.autoread = true

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

-- restore cursor position
local function restore_cursor()
	if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end
vim.api.nvim_create_autocmd({"BufReadPost"}, { callback = restore_cursor })

-- start git commits and rebases in insert mode
vim.api.nvim_create_augroup("bufcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = "bufcheck",
	pattern = { "gitcommit" },
	command = "startinsert | 1",
})

require('plugins')
require('plugin_theme')
require('plugin_completion') -- also for snippets
require('go')

-- ALE use quickfix window
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 1

-- harpoon keybindings
vim.api.nvim_set_keymap('n','<leader>p', ':lua require("harpoon.mark").add_file()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>d', ':lua require("harpoon.mark").rm_file()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>h', ':lua require("harpoon.ui").nav_prev()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>l', ':lua require("harpoon.ui").nav_next()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader><leader>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true, silent = true })

require("harpoon").setup({ 
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = true,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = true,
})
