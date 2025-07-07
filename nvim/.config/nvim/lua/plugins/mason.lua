return {
    {
        "mason-org/mason.nvim",
        config = function()
            require('mason').setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function ()
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
        end
    },
}
