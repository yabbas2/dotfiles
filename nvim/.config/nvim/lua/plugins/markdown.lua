return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        },
        ft = { "markdown", "codecompanion" },
        config = function()
            require('render-markdown').setup({})
        end,
    }
}
