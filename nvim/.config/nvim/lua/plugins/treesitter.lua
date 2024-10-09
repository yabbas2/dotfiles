return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "python", "c", "cpp", "lua", "vim", "json", "cmake", "css", "dockerfile", "gitignore", "html", "javascript", "json", "markdown", "markdown_inline", "rust", "vue", "dap_repl", "xml" },
                highlight = { enable = true },
                indent = { enable = true },
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function ()
            require('nvim-treesitter.configs').setup {
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["as"] = "@scope",
                        },
                        include_surrounding_whitespace = true,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>sp"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>sP"] = "@parameter.inner",
                        },
                    },
                },
            }
        end
    },
}
