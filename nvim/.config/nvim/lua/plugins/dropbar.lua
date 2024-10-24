return {
    {
        "Bekaboo/dropbar.nvim",
        config = function ()
            require('dropbar').setup()
            vim.keymap.set("n", "<leader>pp", function () require('dropbar.api').pick() end, { silent = true })
        end
    },
}
