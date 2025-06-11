return {
    {
        'rcarriga/nvim-notify',
        config = function()
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
        end
    }
}
