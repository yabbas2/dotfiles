return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function ()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "python", "c", "cpp", "lua", "vim", "cmake", "css", "dockerfile", "gitignore", "html", "javascript", "json", "markdown", "markdown_inline", "rust", "xml", "regex", "bash", "latex" },
                highlight = { enable = true },
                indent = { enable = true },
                additional_vim_regex_highlighting = false,
            }
        end
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "VeryLazy",
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
                        include_surrounding_whitespace = false,
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ["<leader>sn"] = "@parameter.inner",
                        },
                        swap_previous = {
                            ["<leader>sp"] = "@parameter.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true,
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]p"] = "@parameter.inner",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[p"] = "@parameter.inner",
                        }
                    },
                }
            }
        end
    },
}
