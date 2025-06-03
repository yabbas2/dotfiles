return {
    "RRethy/vim-illuminate",
    event = "VeryLazy",
    config = function ()
        require('illuminate').configure({
            under_cursor = false,
            modes_allowlist = { 'n', 'v' },
            filetypes_denylist = {
				'git',
				'NvimTree',
			},
            providers = {
                'regex',
            },
        })
        vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "Visual" })
        vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "IlluminatedWordText" })
        vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "IlluminatedWordText" })
    end
}
