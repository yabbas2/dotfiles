vim.pack.add({ 'https://github.com/stevearc/overseer.nvim' })

require("overseer").setup()
vim.keymap.set("n", "<leader>or", "<CMD>OverseerRun<CR>")
