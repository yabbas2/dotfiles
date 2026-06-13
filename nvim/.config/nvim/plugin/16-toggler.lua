vim.pack.add({ 'https://github.com/nguyenvukhang/nvim-toggler' })

require('nvim-toggler').setup({
    inverses = {
        ['TRUE'] = 'FALSE',
        ['STD_ON'] = 'STD_OFF',
    },
    remove_default_keybinds = false, -- <leader>i
    remove_default_inverses = false,
})
