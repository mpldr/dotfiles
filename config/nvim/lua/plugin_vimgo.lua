vim.g['go_fmt_command'] = "gopls"
vim.g['go_gopls_gofumpt'] = 1
vim.g['go_auto_type_info'] = 1

-- Custom keybindings from hell
vim.keymap.set('n', 'gie', '<Cmd>GoIfErr<CR>' )
vim.keymap.set('n', 'gis', '<Cmd>GoFillStruct<CR>' )

