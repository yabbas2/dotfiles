local config = require("nvim-treesitter.configs")

config.setup({
    ensure_installed = { "python", "c", "cpp", "lua", "vim", "json", "cmake", "css", "dockerfile", "gitignore", "html", "javascript", "json", "markdown", "rust", "vue" },
    highlight = { enable = true },
    indent = { enable = true },
})
