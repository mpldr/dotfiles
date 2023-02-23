vim.g['deoplete#enable_at_startup'] = 1
vim.g['deoplete#complete_method'] = "omnifunc"

vim.g['ale_sign_error'] = '❌'
vim.g['ale_sign_warning'] = '⚠'

vim.cmd [[call deoplete#custom#option('omni_patterns', {'go': '[^. *\t]\.\w*', 'html': ['<', '</', '<[^>]*\s[[:alnum:]-]*'],})]]

vim.api.nvim_set_keymap("i", "<silent><expr><tab>", 'pumvisible() ? "<C-j>" : deoplete#manual_complete()', {noremap=true})
vim.api.nvim_set_keymap("i", "<silent><expr><tab>", 'pumvisible() ? "<C-j>" : deoplete#manual_complete()', {noremap=true})

-- TODO: 
