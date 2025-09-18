return {
    {
        "olimorris/codecompanion.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            local user = vim.env.USER or "User"
            require("codecompanion").setup({
                adapters = {
                    http = {
                        gemini = function()
                            return require("codecompanion.adapters").extend("gemini", {
                                env = { api_key = vim.env.GEMINI_API_KEY, }
                            })
                        end,
                    },
                },
                strategies = {
                    chat = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash",
                        roles = {
                            user = " " .. user:sub(1, 1):upper() .. user:sub(2),
                        },
                    },
                    inline = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash",
                    },
                    cmd = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash",
                    }
                },
                display = {
                    chat = {
                        show_settings = true,
                    },
                },
            })
            -- hide line numbers for chat
            vim.api.nvim_create_autocmd("BufEnter", {
                pattern = "*codecompanion*",
                callback = function()
                    vim.opt_local.number = false
                    vim.opt_local.relativenumber = false
                    vim.opt_local.conceallevel = 3
                end
            })
        end,
        keys = {
            { "<leader>aa", "<CMD>CodeCompanionChat Toggle<CR>", mode = { "n" } },
            { "<leader>ag", "<CMD>CodeCompanionChat Add<CR>",    mode = { "v" } },
            { "<leader>ap", "<CMD>CodeCompanionActions<CR>",     mode = { "n" } },
        }
    }
}
