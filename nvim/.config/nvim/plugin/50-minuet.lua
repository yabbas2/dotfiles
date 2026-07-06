vim.pack.add({ 'https://github.com/milanglacier/minuet-ai.nvim' })

require('minuet').setup {
    virtualtext = {
        auto_trigger_ft = { '*' },
        auto_trigger_ignore_ft = { 'snacks_terminal', 'snacks_picker_input', 'markdown' },
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
    notify = false,
    provider = 'openai_compatible',
    request_timeout = 2.5,
    throttle = 1500, -- Increase to reduce costs and avoid rate limits
    debounce = 600,  -- Increase to reduce costs and avoid rate limits
    provider_options = {
        openai_compatible = {
            api_key = 'OPENCODE_ZEN_API_KEY',
            end_point = 'https://opencode.ai/zen/v1/chat/completions',
            model = 'deepseek-v4-flash-free',
            name = 'Opencode',
            optional = {
                max_tokens = 56,
                top_p = 0.9,
                -- disable thinking to avoid first token latency
                thinking = { type = 'disabled' },
            },
        },
    },
}
