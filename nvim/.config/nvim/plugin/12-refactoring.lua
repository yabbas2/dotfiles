vim.pack.add({
    "https://github.com/lewis6991/async.nvim",
    "https://github.com/theprimeagen/refactoring.nvim",
})

-- require("refactoring").setup({})

vim.keymap.set({ "n", "x" }, "<leader>rs", function()
    require("refactoring").select_refactor()
end, { desc = "Select refactor" })
