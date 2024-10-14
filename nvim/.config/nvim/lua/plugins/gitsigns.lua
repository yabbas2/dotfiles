return {
    "lewis6991/gitsigns.nvim",
    config = function ()
        require('gitsigns').setup {
            sign_priority = 11,
            signs_staged_enable = false,
        }
    end
}
