return {
    {
        "EdenEast/nightfox.nvim",
        config = function ()
            require('nightfox').setup({
                options = {
                    -- dim_inactive = true,
                    styles = {
                        comments = "italic",
                    },
                    modules = {},
                },
            })
            vim.cmd("colorscheme duskfox")
        end
    }
}
