vim.opt.termguicolors = true

require('onedark').setup {
	style = "cool",
	transparent = true,
	code_style = {
		comments = 'italic',
		keywords = 'italic,bold',
		functions = 'none',
		strings = 'none',
		variables = 'none'
	},
}
require('onedark').load()
