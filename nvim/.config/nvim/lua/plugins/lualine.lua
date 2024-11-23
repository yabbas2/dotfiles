return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local function lsp_client()
            local buf_client_names = {}
            local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
            for _, client in pairs(buf_clients) do
                table.insert(buf_client_names, client.name)
            end
            return ' ' .. (#buf_client_names ~= 0 and buf_client_names[1] or 'no_lsp')
        end
        require'lualine'.setup {
            options = {
                theme  = "ayu_dark",
                component_separators = { left = '|', right = '|'},
                section_separators = '',
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        "diagnostics",
                        symbols = {
                            error = "󰅙 ",
                            warn = "󰀦 ",
                            info = "󰋼 ",
                            hint = "󰋗 ",
                        },
                    },
                },
                lualine_c = {
                    {
                        'filename',
                        file_status = true,
                        path = 2,
                        shorting_target = 40,
                        symbols = {
                            modified = '~',
                            readonly = '',
                        }
                    }
                },
                lualine_x = {
                    'encoding',
                    'fileformat',
                    'filetype',
                    lsp_client,
                },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    {
                         'filename',
                        symbols = {
                            modified = '~',
                            readonly = '',
                        }
                    },
                },
                lualine_x = {'filetype'},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'nvim-dap-ui', 'overseer', 'mason', 'neo-tree', 'quickfix', 'symbols-outline' },
            tabline = {
                lualine_a = {
                    {
                        'tabs',
                        symbols = {
                            modified = '~',
                        },
                    },
                },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {
                    {
                        'buffers',
                        symbols = {
                            alternate_file = '',
                        },
                    },
                }
            }
        }
    end
}
