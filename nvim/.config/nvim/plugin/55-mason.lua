vim.pack.add({ 'https://github.com/mason-org/mason.nvim' })
require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

vim.pack.add({ 'https://github.com/jay-babu/mason-nvim-dap.nvim' })
require('mason-nvim-dap').setup({
    handlers = {
        function(config)
            -- all sources with no handler get passed here
            -- Keep original functionality
            require('mason-nvim-dap').default_setup(config)
        end,
        python = function(config)
            config.adapters = {
                type = "executable",
                command = os.getenv('HOME') .. '/.pyvenv/bin/python',
                args = { "-m", "debugpy.adapter" },
            }
            require('mason-nvim-dap').default_setup(config)
        end,
    },
})
