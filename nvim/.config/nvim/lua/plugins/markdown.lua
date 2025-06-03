return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        event = "VeryLazy",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "markdown", "codecompanion" },
        config = function()
            require('render-markdown').setup({})
        end,
    }
}
