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
                    auto_trigger_ignore_ft = { 'codecompanion', 'snacks_picker_input' },
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
    }
}
