return {
    {
        'MeanderingProgrammer/render-markdown.nvim',
        event = "VeryLazy",
        ft = { "markdown", "codecompanion" },
        config = function()
            require('render-markdown').setup({})
        end,
    }
}
