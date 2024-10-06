return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        require("bufferline").setup{
            options = {
                mode = "tabs",
                show_buffer_close_icons = false,
                show_close_icon = false,
                right_mouse_command  = "",
                middle_mouse_command = "",
                left_mouse_command   = "",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "NvimTree",
                        text_align = "center",
                        separator = false,
                    }
                },
            }
        }
    end
}
