vim.pack.add({ 'https://github.com/stevearc/conform.nvim' })

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        ["*"] = { "codespell" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    format_on_save = nil,
    format_after_save = nil,
})

vim.keymap.set({ "n" }, "grf", function() require("conform").format() end)
