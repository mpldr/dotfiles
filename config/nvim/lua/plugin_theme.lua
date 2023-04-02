-- theme in general
local c = require('vscode.colors').get_colors()
require('vscode').setup({
	transparent = true,
	italic_comments = true,
	color_overrides = {
		vscLineNumber = '#FFFFFF',
	},
})
require('vscode').load()

-- buffer line
require('bufferline').setup {
	options = {
		modified_icon = '',
		show_buffer_icons = false,
		show_buffer_close_icon = false,
	}
}
