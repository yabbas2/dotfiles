return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "python", "c", "cpp", "lua", "vim", "cmake", "css", "dockerfile", "gitignore", "html", "javascript", "json", "markdown", "markdown_inline", "rust", "xml", "regex" },
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
                            ["ab"] = "@block.outer",
                            ["ib"] = "@block.inner",
                            ["ad"] = "@conditional.outer",
                            ["id"] = "@conditional.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["ap"] = "@parameter.outer",
                            ["ip"] = "@parameter.inner",
                            ["am"] = "@comment.outer",
                            ["im"] = "@comment.inner",
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
