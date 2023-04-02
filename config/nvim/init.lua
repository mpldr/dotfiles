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

-- open file browser on -
vim.api.nvim_set_keymap("n", "-", ":Explore<CR>", {silent = true})

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

-- faster updates
vim.opt.updatetime=100

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

-- move around splits with shift-arrows
vim.api.nvim_set_keymap('n', '<s-up>', ':wincmd k<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-down>', ':wincmd j<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-left>', ':wincmd h<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<s-right>', ':wincmd l<cr>', { noremap = true, silent = true })

-- restore cursor position
local function restore_cursor()
	if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
		vim.cmd("normal! g'\"")
	end
end
vim.api.nvim_create_autocmd({"BufReadPost"}, { callback = restore_cursor })

package.path = package.path..";"..os.getenv("HOME").."/.config/nvim/lua/?.lua"
require('plugins')
