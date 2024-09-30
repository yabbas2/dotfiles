return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
        },
        config = function ()
            local dapui = require('dapui')
            local dap = require("dap")
            local keymap = vim.keymap.set
            local opts = { noremap = true, silent = true }

            ---- DAP ui ----
            dapui.setup({
                icons = { expanded = "▾", collapsed = "▸" },
                mappings = {
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                expand_lines = true,
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "watches",
                            "breakpoints",
                            "stacks",
                        },
                        size = 40,
                        position = "right",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25,
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil,
                    max_width = nil,
                    border = "single",
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 2 },
                render = {
                    max_type_length = nil,
                },
            })

            ---- DAP ----
            dap.set_log_level("TRACE")
            dap.listeners.before.launch.dapui = function()
                dapui.open()
            end

            ---- Icons ----
            vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

            ---- Keymaps ----
            keymap('n', '<Leader>dc', function() dap.continue() end, opts)
            keymap('n', '<Leader>do', function() dap.step_over() end, opts)
            keymap('n', '<Leader>di', function() dap.step_into() end, opts)
            keymap('n', '<Leader>dO', function() dap.step_out() end, opts)
            keymap('n', '<Leader>db', function() dap.toggle_breakpoint() end, opts)
            keymap("n", '<Leader>dq', function() dap.terminate( { cb = dapui.close() } ) end, opts)
            keymap('n', '<Leader>dr', function() dap.run_to_cursor() end, opts)
            keymap('n', '<Leader>dR', function() dap.restart() end, opts)
            keymap("n", '<Leader>dw', function() dapui.elements.watches.add(vim.fn.expand("<cword>")) end, opts)
            -- keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
            -- keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
            -- keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)

            ---- DAP language adapters ----
            dap.adapters.cppdbg = {
                id = 'cppdbg',
                type = 'executable',
                command = os.getenv('HOME') .. '/.vscode/extensions/ms-vscode-cpptools/debugAdapters/bin/OpenDebugAD7',
            }

            dap.adapters.python = function(cb, config)
                cb({
                    type = 'executable',
                    command = os.getenv('HOME') .. '/.pyvenv/bin/python',
                    args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = 'python',
                    },
                })
            end
            dap.configurations.python = {}
            -- load .vscode/launch.json (default path is root dir)
            -- require('dap.ext.vscode').load_launchjs()
        end
    }
}
