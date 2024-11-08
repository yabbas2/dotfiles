return {
    {
        "hedyhli/outline.nvim",
        event = "VeryLazy",
        keys = {
            { "<leader>oo", "<CMD>Outline<CR>", mode = { "n" }},
        },
        config = function ()
            require('outline').setup({
                outline_window = {
                    position = "right",
                    width = 40,
                    relative_width = false,
                },
                symbols = {
                    icon_source = 'lspkind',
                },
                symbol_folding = {
                    autofold_depth = 1,
                    auto_unfold = {
                        hovered = true,
                    },
                },
            })
        end
    },
}
