vim.pack.add({ 'https://github.com/nvim-neotest/nvim-nio' })
vim.pack.add({ 'https://github.com/rcarriga/nvim-dap-ui' })
vim.pack.add({ 'https://github.com/mfussenegger/nvim-dap' })

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

vim.keymap.set("n", "<F9>", function() require("dap").toggle_breakpoint() end)
vim.keymap.set("n", "<F10>", function() require("dap").step_over() end)
vim.keymap.set("n", "<F11>", function() require("dap").step_into() end)
vim.keymap.set("n", "<F12>", function() require("dap").step_out() end)
vim.keymap.set("n", "<F5>", function() require("dapui").open(); require("dap").continue() end)
vim.keymap.set("n", "<F6>", function() require("dap").restart() end)
vim.keymap.set("n", "<F7>", function() require("dapui").close(); require("dap").terminate() end)
vim.keymap.set("n", "<F8>", function() require("dap").run_to_cursor() end)
vim.keymap.set("n", "<Leader>dw", function() require("dapui").elements.watches.add(vim.fn.expand("<cword>")) end)
