local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerCompile
	augroup end
]])

return require('packer').startup({function(use)
	use 'wbthomason/packer.nvim'

	use 'navarasu/onedark.nvim'

	use 'airblade/vim-gitgutter'

	use {
		'kdheepak/tabline.nvim',
		config = function()
			require'tabline'.setup {
				-- Defaults configuration options
				enable = true,
				options = {
				-- If lualine is installed tabline will use separators configured in lualine by default.
				-- These options can be used to override those settings.
					section_separators = {'', ''},
					component_separators = {'', ''},
					max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
					show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
					show_devicons = true, -- this shows devicons in buffer section
					show_bufnr = false, -- this appends [bufnr] to buffer section,
					show_filename_only = false, -- shows base filename only instead of relative path in filename
					modified_icon = "* ", -- change the default modified icon
					modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
					show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
				}
			}
			vim.cmd[[
				set guioptions-=e " Use showtabline in gui vim
				set sessionoptions+=tabpages,globals " store tabpages and globals in session
			]]
		end,
		requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
	}

	use {
		'tpope/vim-dispatch',
		opt = true,
		cmd = {'Dispatch', 'Make', 'Focus', 'Start'}
	}

	use { 
		'fatih/vim-go',
		ft = {'go'},
		run = function() vim.cmd([[GoUpdateBinaries]]) end
	}

	use {
		'SirVer/ultisnips',
		ft = {'go'}
	}
	use {
		'honza/vim-snippets',
		ft = {'go'}
	}

	use {
		'w0rp/ale',
		ft = {'go', 'sh'}
	}

	use { 'Shougo/deoplete.nvim' }
	use { 'Shougo/neosnippet.vim' }
	use { 'Shougo/neosnippet-snippets' }

	use { 'nvim-lua/plenary.nvim' }
	use { 'ThePrimeagen/harpoon' }

	use { 'ThePrimeagen/vim-be-good' }

	if packer_bootstrap then
		require('packer').sync()
	end
end,
config = {
	display = {
		open_fn = function()
			return require('packer.util').float({ border = 'single' })
		end
	}
}})
