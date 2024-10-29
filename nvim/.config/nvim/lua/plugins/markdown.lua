return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle" },
    ft = { "markdown" },
    build = function()
        require("lazy").load { plugins = { "markdown-preview.nvim" } }
        vim.fn["mkdp#util#install"]()
    end,
    keys = {
        {"<leader>md", "<CMD>MarkdownPreviewToggle<CR>", mode = { "n" }},
    },
}
