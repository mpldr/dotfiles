vim.api.nvim_set_keymap('n','<leader>p', ':lua require("harpoon.mark").add_file()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>d', ':lua require("harpoon.mark").rm_file()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tr', ':lua require("harpoon.ui").nav_prev()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader>tz', ':lua require("harpoon.ui").nav_next()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n','<leader><leader>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', { noremap = true, silent = true })

require("harpoon").setup({ 
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = true,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    mark_branch = true,
})

