return {
    {
        "voldikss/vim-floaterm",
        event = "VeryLazy",
        config = function ()
            vim.api.nvim_set_hl(0, "Floaterm", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "FloatermNC", { link = "TelescopeNormal" })
            vim.api.nvim_set_hl(0, "FloatermBorder", { link = "TelescopeBorder" })
            vim.g.floaterm_autoinsert = false
            function _G.floaterm_opened()
                -- do stuff here
            end
            vim.cmd("autocmd User FloatermOpen lua floaterm_opened()")
        end,
        keys = {
            { "<leader>tg", "<CMD>FloatermNew --wintype=float --name=lazygit --position=bottomright --height=0.6 --width=0.6 lazygit<CR>", mode = { "n" } },
            { "<leader>tn", "<CMD>FloatermNew --wintype=float --position=bottomright --height=0.5 --width=0.5<CR>", mode = { "n" } },
            { "<F2>", "<CMD>FloatermNext<CR>", mode = { "n", "t" } },
            { "<F1>", "<CMD>FloatermPrev<CR>", mode = { "n", "t" } },
            { "<F3>", "<CMD>FloatermToggle<CR>", mode = { "n", "t" } },
            { [[<C-N>]], [[<C-\><C-N>]], mode = { "t" } },
            { [[<C-h>]], [[<C-\><C-N><C-W>h]], mode = { "t" } },
            { [[<C-j>]], [[<C-\><C-N><C-W>j]], mode = { "t" } },
            { [[<C-k>]], [[<C-\><C-N><C-W>k]], mode = { "t" } },
            { [[<C-l>]], [[<C-\><C-N><C-W>l]], mode = { "t" } },
        },
    }
}
