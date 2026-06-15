vim.pack.add({ 'https://github.com/MunifTanjim/nui.nvim' })
vim.pack.add({ 'https://github.com/folke/noice.nvim' })

require('noice').setup({
    lsp = {
        progress = { enabled = false },
        hover = { enabled = false },
        signature = { enabled = false },
    },
    notify = { enabled = false },
    presets = {
        bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
    cmdline = {
        view = "cmdline_popup",
        format = {
            cmdline = { icon = " " },
        }
    },
    popupmenu = {
        enabled = false,
    },
    messages = {
        view_search = false,
    }
})
