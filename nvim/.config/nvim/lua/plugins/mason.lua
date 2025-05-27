return {
    {
        "williamboman/mason.nvim",
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
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer', 'clangd', 'lemminx', 'jsonls', 'cssls', 'html', 'ts_ls' },
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        config = function()
            require('mason-nvim-dap').setup({
                ensure_installed = { "cppdbg" },
                handlers = {
                    function(config)
                        -- all sources with no handler get passed here
                        -- keep original functionality
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
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local opts = { noremap = true, silent = true }
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local custom_attach = function(client, bufnr)
                opts.buffer = bufnr
                -- general keymaps
                vim.keymap.set('n', 'grf', function() vim.lsp.buf.format() end, opts)
                -- disable all lsp highlighting
                -- client.server_capabilities.documentHighlightProvider = false
                -- client.server_capabilities.semanticTokensProvider = false
            end

            lspconfig.ts_ls.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.html.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.cssls.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.jsonls.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.pylsp.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
                settings = {
                    pylsp = {
                        plugins = {
                            rope_autoimport = { enabled = false, },
                            pycodestyle = { ignore = { 'E501', 'W503' } },
                            black = { enabled = false },
                            autopep8 = { enabled = false },
                            yapf = { enabled = false },
                            pylint = { enabled = false },
                            pyflakes = { enabled = false },
                            flake8 = { enabled = false },
                        }
                    },
                }
            }

            lspconfig.clangd.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT", },
                        diagnostics = { globals = { "vim" }, },
                        workspace = { library = vim.api.nvim_get_runtime_file("", true), },
                        telemetry = { enable = false, },
                    },
                },
            }

            lspconfig.lemminx.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
                settings = {
                    lemminx = {
                        filetypes = { 'xml', 'arxml', 'xsd', 'xsl', 'xslt', 'svg' },
                    }
                }
            }

            vim.keymap.set('n', "<leader>lR", "<CMD>LspRestart<CR>")
            vim.keymap.set('n', "<leader>lS", "<CMD>LspStart<CR>")
            vim.keymap.set('n', "<leader>ls", "<CMD>LspStop<CR>")
        end,
    },
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

            vim.fn.sign_define("DapBreakpoint", { text = "⭕", texthl = "", linehl = "", numhl = "" })
            vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })
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
