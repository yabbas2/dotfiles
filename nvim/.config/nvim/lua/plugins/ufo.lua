return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {},
    config = function()
        require("ufo").setup({
            provider_selector = function(_, _, _)
                return {'treesitter'}
            end
        })
    end,
    keys = {
        { "zR", "<CMD>lua require('ufo').openAllFolds()<CR>", mode = { "n" } },
        { "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>", mode = { "n" } },
    },
}
