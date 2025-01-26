return {
    {
        'nguyenvukhang/nvim-toggler',
        config = function ()
            require('nvim-toggler').setup({
                inverses = {
                    ['TRUE'] = 'FALSE',
                    ['STD_ON'] = 'STD_OFF',
                },
                remove_default_keybinds = false, -- <leader>i
                remove_default_inverses = false,
            })
        end
    }
}
