return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function ()
        require("bufferline").setup{
            options = {
                right_mouse_command = false,
                middle_mouse_command = "bdelete! %d",
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "File Explorer",
                        text_align = "center",
                        separator = false,
                    }
                },
            }
        }
    end
}
