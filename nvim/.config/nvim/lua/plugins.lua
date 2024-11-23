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
        require('plugins.autosession'),
        require('plugins.catppuccin'),
        require('plugins.cmp'),
        require('plugins.git'),
        require('plugins.ibl'),
        require('plugins.illuminate'),
        require('plugins.lualine'),
        require('plugins.markdown'),
        require('plugins.mason'),
        require('plugins.neotree'),
        require('plugins.noice'),
        require('plugins.outline'),
        require('plugins.overseer'),
        require('plugins.pairs'),
        require('plugins.qf'),
        require('plugins.snacks'),
        require('plugins.telescope'),
        require('plugins.textcase'),
        require('plugins.tmux'),
        require('plugins.todo'),
        require('plugins.treesitter'),
        require('plugins.ufo'),
        require('plugins.undo'),
        require('plugins.whitespace'),
    },
    rocks = { enabled = false },
})
