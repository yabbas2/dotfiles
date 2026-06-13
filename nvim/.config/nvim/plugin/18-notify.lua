vim.pack.add({ 'https://github.com/rcarriga/nvim-notify' })

require('notify').setup({
    render = "compact",
    stages = "fade",
    top_down = false,
    on_open = function(win)
        local config = vim.api.nvim_win_get_config(win)
        config.border = "single"
        vim.api.nvim_win_set_config(win, config)
    end,
})
vim.notify = require("notify")
