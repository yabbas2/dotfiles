return {
    {
        "EdenEast/nightfox.nvim",
        config = function ()
            require('nightfox').setup({
                options = {
                    dim_inactive = true,
                    styles = {
                        comments = "italic",
                    },
                    modules = {
                        neogit = false,
                        gitsigns = false,
                    },
                },
            })
            vim.cmd("colorscheme duskfox")
        end
    }
}
