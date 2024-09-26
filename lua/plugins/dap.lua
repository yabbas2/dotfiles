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
                    -- Use a table to apply multiple mappings
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                -- Expand lines larger than the window
                expand_lines = true,
                -- Layouts define sections of the screen to place windows.
                -- The position can be "left", "right", "top" or "bottom".
                -- The size specifies the height/width depending on position. It can be an Int
                -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
                -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
                -- Elements are the elements shown in the layout (in order).
                -- Layouts are opened in order so that earlier layouts take priority in window sizing.
                layouts = {
                    {
                        elements = {
                            { id = "scopes", size = 0.25 },
                            "watches",
                            "breakpoints",
                            "stacks",
                        },
                        size = 40, -- 40 columns
                        position = "right",
                    },
                    {
                        elements = {
                            "repl",
                            "console",
                        },
                        size = 0.25, -- 25% of total lines
                        position = "bottom",
                    },
                },
                floating = {
                    max_height = nil,  -- These can be integers or a float between 0 and 1.
                    max_width = nil,   -- Floats will be treated as percentage of your screen.
                    border = "single", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                        close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 2 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
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
                command = '/home/yabbas/hmatools/extension/debugAdapters/bin/OpenDebugAD7',
            }
        end
    }
}
