return {
    "ptdewey/yankbank-nvim",
    lazy = false,
    config = function()
        require('yankbank').setup({
            max_entries = 9,
            num_behavior = "jump",
            focus_gain_poll = true,
        })
    end,
    keys = {
        { "<leader>p", "<CMD>YankBank<CR>", mode = { "n", "v" } },
    }
}
