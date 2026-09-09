vim.pack.add({ 'https://github.com/kevinhwang91/promise-async' })
vim.pack.add({ 'https://github.com/kevinhwang91/nvim-ufo' })

vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = "foldopen:▼,foldsep:│,foldclose:▶"

require("ufo").setup({
    provider_selector = function(_, _, _)
        return { 'treesitter' }
    end
})

vim.keymap.set('n', 'zR', function() require('ufo').openAllFolds() end)
vim.keymap.set('n', 'zM', function() require('ufo').closeAllFolds() end)
