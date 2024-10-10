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
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = { 'jedi_language_server', 'lua_ls', 'rust_analyzer', 'clangd', 'lemminx' },
            })
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function ()
            require('mason-nvim-dap').setup({
                ensure_installed = { "cppdbg" },
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
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local lspconfig = require("lspconfig")
            local opts = { noremap = true, silent = true }
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

            local custom_attach = function(client, bufnr)
                vim.keymap.set('n', '<Leader>rw', function () vim.lsp.buf.rename() end, opts)
                vim.keymap.set('n', '<Leader>ss', function () vim.lsp.buf.hover() end, opts)
                -- client.server_capabilities.semanticTokensProvider = nil
            end

            vim.lsp.handlers["textDocument/hover"] = function(_, result, ctx, config)
                config = config
                or {
                    border = {
                        { "╭", "Comment" },
                        { "─", "Comment" },
                        { "╮", "Comment" },
                        { "│", "Comment" },
                        { "╯", "Comment" },
                        { "─", "Comment" },
                        { "╰", "Comment" },
                        { "│", "Comment" },
                    },
                }
                config.focus_id = ctx.method
                if not (result and result.contents) then
                    return
                end
                local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
                markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
                if vim.tbl_isempty(markdown_lines) then
                    return
                end
                return vim.lsp.util.open_floating_preview(markdown_lines, "markdown", config)
            end

            lspconfig.jedi_language_server.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
                settings = {
                    diagnostics = { enable = true, },
                },
            }

            lspconfig.clangd.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
            }

            lspconfig.rust_analyzer.setup {
                capabilities = capabilities,
                on_attach = custom_attach,
                settings = {
                    ['rust-analyzer'] = {
                        diagnostics = { enable = false }
                    }
                }
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
        end
    },
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
        end
    }
}
