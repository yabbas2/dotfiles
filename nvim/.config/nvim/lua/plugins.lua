local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
   spec = {
        require('plugins.colorscheme'),
        require('plugins.notify'),
        require('plugins.minuet'),
        require('plugins.codecompanion'),
        require('plugins.lualine'),
        require('plugins.markdown'),
        require('plugins.mason'),
        require('plugins.dap'),
        require('plugins.snippet'),
        require('plugins.mini'),
        require('plugins.cmp'),
        require('plugins.noice'),
        require('plugins.overseer'),
        require('plugins.qf'),
        require('plugins.snacks'),
        require('plugins.nvimtree'),
        require('plugins.textcase'),
        require('plugins.tmux'),
        require('plugins.toggler'),
        require('plugins.treesitter'),
        require('plugins.ufo'),
        require('plugins.illuminate'),
    },
    rocks = { enabled = false },
})
