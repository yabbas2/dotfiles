return {
    'rmagatti/auto-session',
    init = function ()
        vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
    config = function ()
        require('auto-session').setup {
            session_lens = {
                load_on_setup = false,
                mappings = {
                    delete_session = { { "i", "n" }, "<C-r>" },
                    alternate_session = { { "i", "n" }, "<C-s>" },
                    copy_session = { { "i", "n" }, "<C-y>" },
                },
                theme_conf = {
                    border = true,
                    initial_mode = "normal",
                },
            },
        }
    end
}
