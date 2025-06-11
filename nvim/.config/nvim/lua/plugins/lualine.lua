return {
    'nvim-lualine/lualine.nvim',
    config = function()
        -- custom extensions
        local codecompanion = {
            sections = {
                lualine_x = { require('plugins.codecompanion_lualine') }
            },
            filetypes = { 'codecompanion' }
        }
        -- setup
        require 'lualine'.setup {
            options = {
                component_separators = { left = '|', right = '|' },
                section_separators = '',
                theme = "catppuccin",
            },
            sections = {
                lualine_b = {
                    'branch',
                    {
                        "diagnostics",
                        symbols = {
                            error = vim.diagnostic.config().signs.text[vim.diagnostic.severity.ERROR],
                            warn  = vim.diagnostic.config().signs.text[vim.diagnostic.severity.WARN],
                            info  = vim.diagnostic.config().signs.text[vim.diagnostic.severity.INFO],
                            hint  = vim.diagnostic.config().signs.text[vim.diagnostic.severity.HINT],
                        },
                    },
                },
                lualine_c = {},
                lualine_x = {
                    'encoding',
                    'fileformat',
                    {
                        'filetype',
                        icon_only = true,
                    },
                    {
                        'lsp_status',
                        ignore_lsp = { 'mini.snippets' },
                    },
                },
                lualine_y = {
                    'progress',
                    {
                        'searchcount',
                        maxcount = 999,
                        timeout = 5,
                        icons_enabled = true,
                        icon = { '', align = 'left' },
                    },
                }
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
                lualine_x = { 'filetype' },
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'nvim-dap-ui', 'overseer', 'mason', 'quickfix', 'nvim-tree', 'lazy', codecompanion },
            tabline = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {
                    '%=',
                    {
                        function() return vim.api.nvim_get_current_tabpage() end,
                        icon = { '󰓹', align = 'left' },
                    },
                    {
                        'filename',
                        file_status = true,
                        path = 2,
                        shorting_target = 40,
                        symbols = {
                            modified = '~',
                            readonly = '',
                        },
                        fmt = function(name, context) return name .. ' |' end,
                        icon = { '', align = 'left' },
                    },
                },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            }
        }
    end
}
