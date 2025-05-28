return {
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dapui = require('dapui')
            local dapui_config = {
                icons = { expanded = "▼", collapsed = "▶", current_frame = "▶" },
                layouts = {
                    {
                        elements = {
                            { id = "scopes",      size = 0.25 },
                            { id = "watches",     size = 0.25 },
                            { id = "breakpoints", size = 0.25 },
                            { id = "stacks",      size = 0.25 },
                        },
                        size = 40,
                        position = "right",
                    },
                    {
                        elements = {
                            { id = "repl",    size = 0.5 },
                            { id = "console", size = 0.5 },
                        },
                        size = 10,
                        position = "bottom",
                    },
                },
            }
            dapui.setup(dapui_config)

            vim.fn.sign_define("DapBreakpoint", { text = "⭕", texthl = "DapBreakpoint", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "👉", texthl = "DapLogPoint", linehl = "", numhl = "" })
        end,
        keys = {
            { '<F5>',       "<CMD>lua require('dapui').open()<CR><CMD>lua require('dap').continue()<CR>",   mode = { 'n' } },
            { '<F10>',      "<CMD>lua require('dap').step_over()<CR>",                                      mode = { 'n' } },
            { '<F11>',      "<CMD>lua require('dap').step_into()<CR>",                                      mode = { 'n' } },
            { '<F12>',      "<CMD>lua require('dap').step_out()<CR>",                                       mode = { 'n' } },
            { '<F9>',       "<CMD>lua require('dap').toggle_breakpoint()<CR>",                              mode = { 'n' } },
            { '<F7>',       "<CMD>lua require('dapui').close()<CR><CMD>lua require('dap').terminate()<CR>", mode = { "n" } },
            { '<F8>',       "<CMD>lua require('dap').run_to_cursor()<CR>",                                  mode = { 'n' } },
            { '<F6>',       "<CMD>lua require('dap').restart()<CR>",                                        mode = { 'n' } },
            { '<Leader>dw', "<CMD>lua require('dapui').elements.watches.add(vim.fn.expand('<cword>'))<CR>", mode = { "n" } },
        }
    }
}
