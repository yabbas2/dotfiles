local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   spec = {
        require('plugins.bufferline'),
        require('plugins.catppuccin'),
        require('plugins.cmp'),
        require('plugins.dap'),
        require('plugins.gitsigns'),
        require('plugins.lsp'),
        require('plugins.lualine'),
        require('plugins.nvimtree'),
        require('plugins.telescope'),
        require('plugins.treesitter'),
    },
    rocks = { enabled = false },
})
