return {
    "stevearc/overseer.nvim",
    keys = {
        { "<leader>or", "<CMD>OverseerRun<CR>",  mode = { 'n' } }
    },
    config = function ()
        require("overseer").setup()
    end
}
