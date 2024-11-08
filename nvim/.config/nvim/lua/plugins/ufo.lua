return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    lazy = false,
    init = function ()
        vim.opt.foldcolumn = "1"
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99
        vim.opt.foldenable = true
        vim.opt.fillchars = "foldopen:▼,foldsep:│,foldclose:▶"
    end,
    config = function()
        require("ufo").setup({
            provider_selector = function(_, _, _)
                return {'treesitter'}
            end
        })
    end,
    keys = {
        { "zR", "<CMD>lua require('ufo').openAllFolds()<CR>", mode = { "n" } },
        { "zM", "<CMD>lua require('ufo').closeAllFolds()<CR>", mode = { "n" } },
    },
}
