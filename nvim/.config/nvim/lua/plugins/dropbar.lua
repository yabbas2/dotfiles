return {
    {
        "Bekaboo/dropbar.nvim",
        lazy = false,
        keys = {
            {"<leader>pp", function () require('dropbar.api').pick() end, mode = { "n" }},
        },
        config = function ()
            require('dropbar').setup()
        end
    },
}
