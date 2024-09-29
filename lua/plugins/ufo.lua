return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    opts = {},
    config = function()
        local ufo = require("ufo")
        ufo.setup()

        vim.keymap.set("n", "zR", function() ufo.openAllFolds() end)
        vim.keymap.set("n", "zM", function() ufo.closeAllFolds() end)
    end,
}
