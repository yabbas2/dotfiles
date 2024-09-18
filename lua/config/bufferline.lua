vim.opt.termguicolors = true
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
