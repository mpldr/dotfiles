local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	-- fn.system({'yay', '-Syu', 'go', 'shellcheck', 'python', '--noconfirm'})
	vim.cmd("terminal yay -Syu go shellcheck python python-pynvim clang gopls bash-language-server ltex-ls-bin --noconfirm")
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

return require('packer').startup({function(use)
	-- packer managed packer
	use 'wbthomason/packer.nvim'

	-- nice file menu
	use { 'ThePrimeagen/harpoon', requires = { { 'nvim-lua/plenary.nvim' }} }

	-- Go-editing
	use {
		'fatih/vim-go',
		ft = {'go'},
		run = function() vim.cmd([[GoUpdateBinaries]]) end
	}

	-- extra file formats
	use { 'codelitt/vim-qtpl', ft = {'qtpl'} }

	-- snippets and completion
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-path'},
			{'quangnguyen30192/cmp-nvim-ultisnips', requires = { 'SirVer/ultisnips' }},
		}
	}

	-- autolint all the things
	use { 'dense-analysis/ale' }

	-- better markdown editing
	use {
		'gabrielelana/vim-markdown',
		ft = {'markdown'},
		requires = { 'godlygeek/tabular' },
	}

	------------------------------------
	--        the small things        --
	------------------------------------

	-- sudo for writing and editing if needed
	use { 'lambdalisue/suda.vim' }

	-- align stuff
	use { 'tommcdo/vim-lion' }

	-- comment stuff out
	use { 'tpope/vim-commentary' }

	------------------------------------
	--          "AESTHETICS"          --
	------------------------------------

	-- show git diffs in the gutter
	use { 'mhinz/vim-signify' }

	-- say what you want, but that colorscheme is quite alright
	use { 'Mofiqul/vscode.nvim' }

	-- show me my open buffers
	use {
		'akinsho/bufferline.nvim',
		requires = 'nvim-tree/nvim-web-devicons'
	}

	if packer_bootstrap then
		require('packer').sync()
		vim.fn.PackerInstall()
	end

	-- load plugin-specific settings
	files = io.popen('find "$HOME"/.config/nvim/lua/ -name plugin_*.lua')
	for file in files:lines() do
		local req_file = file:gmatch('%/lua%/(.+).lua$'){0}:gsub('/', '.')
		status_ok, _ = pcall(require, req_file)

		if not status_ok then
			vim.notify('Failed loading ' .. req_file, vim.log.levels.ERROR)
		end
	end
end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
}})
