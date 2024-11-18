return {
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = function ()
            require('nvim-autopairs').setup ({
                check_ts = true,
                map_cr = false,
            })
            local cmp_autopairs = require('nvim-autopairs.completion.cmp')
            local cmp = require('cmp')
            cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
        end
    }
}
