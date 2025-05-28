return {
    {
        'milanglacier/minuet-ai.nvim',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require('minuet').setup {
                virtualtext = {
                    auto_trigger_ft = { '*' },
                    auto_trigger_ignore_ft = { 'codecompanion' },
                    keymap = {
                        accept = '<A-a>',
                        accept_line = nil,
                        accept_n_lines = '<A-z>', -- e.g. "A-z 2 CR" will accept 2 lines
                        prev = '<A-[>',
                        next = '<A-]>',
                        dismiss = '<A-e>',
                    },
                },
                cmp = { enable_auto_complete = false, },
                blink = { enable_auto_complete = false, },
                provider = 'gemini',
                provider_options = {
                    gemini = {
                        model = 'gemini-2.5-flash-preview-05-20',
                        api_key = 'GEMINI_API_KEY',
                        optional = {
                            generationConfig = {
                                maxOutputTokens = 256,
                                thinkingConfig = { thinkingBudget = 0, },
                            },
                            safetySettings = {{
                                category = 'HARM_CATEGORY_DANGEROUS_CONTENT',
                                threshold = 'BLOCK_ONLY_HIGH',
                            }},
                        },
                    },
                },
            }
        end,
    },
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
                    gemini = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            env = { api_key = vim.env.GEMINI_API_KEY, }
                        })
                    end,
                },
                strategies = {
                    chat = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash-preview-05-20",
                        roles = {
                            user = " " .. user:sub(1, 1):upper() .. user:sub(2),
                        },
                    },
                    inline = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash-preview-05-20",
                    },
                    cmd = {
                        adapter = "gemini",
                        model = "gemini-2.5-flash-preview-05-20",
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
            { "<leader>ag", "<CMD>CodeCompanionChat Add<CR>", mode = { "v" } },
            { "<leader>ap", "<CMD>CodeCompanionActions<CR>", mode = { "n" } },
        }
    },
}
