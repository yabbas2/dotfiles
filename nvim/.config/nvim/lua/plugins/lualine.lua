return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        require('lualine').setup {
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
                lualine_c = { { 'filename', path = 2 } },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'filetype'},
                lualine_y = {},
                lualine_z = {}
            },
            extensions = { 'nvim-dap-ui', 'overseer', 'mason', 'neo-tree', 'quickfix', 'symbols-outline' },
            tabline = {
                lualine_a = {'tabs'},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {'buffers'},
            }
        }
    end
}
