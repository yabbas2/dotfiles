return {
    'rmagatti/auto-session',
    config = function ()
        require('auto-session').setup {
            suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            session_lens = {
                mappings = {
                    delete_session = { { "i", "n" }, "<C-D>" },
                    alternate_session = { { "i", "n" }, "<C-S>" },
                    copy_session = { { "i", "n" }, "<C-Y>" },
                },
                theme_conf = {
                    border = true,
                    initial_mode = "normal",
                },
            },
        }
    end
}
