return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local config = require("nvim-treesitter.configs")

        config.setup({
            ensure_installed = { "python", "c", "cpp", "lua", "vim", "json", "cmake", "css", "dockerfile", "gitignore", "html", "javascript", "json", "markdown", "markdown_inline", "rust", "vue", "dap_repl", "xml" },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
