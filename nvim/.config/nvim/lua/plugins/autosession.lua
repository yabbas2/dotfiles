return {
    'rmagatti/auto-session',
    init = function ()
        vim.opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
    end,
    config = function ()
        require('auto-session').setup {
            session_lens = {
                load_on_setup = false,
            },
        }
    end
}
