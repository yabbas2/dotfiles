return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", "<CMD>UndotreeToggle<CR>", mode = { "n" } }
    },
    config = function ()
        vim.g.undotree_WindowLayout = 2
    end
}
