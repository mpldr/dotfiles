vim.g.ale_fix_on_save = 1
vim.g.ale_lint_on_text_changed = 1
vim.g.ale_fixers = {
	["*"] = { 'remove_trailing_lines', 'trim_whitespace' }
}
vim.g.ale_linters = {
	go = { 'revive', 'staticcheck' }
}
