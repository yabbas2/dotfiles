return {
    'tanvirtin/vgit.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- Lazy loading on 'VimEnter' event is necessary.
    event = 'VimEnter',
    config = function()
        require("vgit").setup({
            keymaps = {
                { mode = 'n', key = '<leader>gk', handler = function() require('vgit').hunk_up() end },
                { mode = 'n', key = '<leader>gj', handler = function() require('vgit').hunk_down() end },
                { mode = 'n', key = '<leader>gs', handler = function() require('vgit').buffer_hunk_stage() end },
                { mode = 'n', key = '<leader>gr', handler = function() require('vgit').buffer_hunk_reset() end },
                { mode = 'n', key = '<leader>gp', handler = function() require('vgit').buffer_hunk_preview() end },
                { mode = 'n', key = '<leader>gb', handler = function() require('vgit').toggle_live_blame() end },
                { mode = 'n', key = '<leader>gf', handler = function() require('vgit').buffer_diff_preview() end },
                { mode = 'n', key = '<leader>gh', handler = function() require('vgit').buffer_history_preview() end },
                { mode = 'n', key = '<leader>gu', handler = function() require('vgit').buffer_reset() end },
                { mode = 'n', key = '<leader>gd', handler = function() require('vgit').project_diff_preview() end },
                { mode = 'n', key = '<leader>gx', handler = function() require('vgit').toggle_diff_preference() end },
                { mode = 'n', key = '<leader>gl', handler = function() require('vgit').project_logs_preview() end },
                { mode = 'n', key = '<leader>gt', handler = function() require('vgit').project_stash_preview() end },
            },
            settings = {
                live_blame = {
                    enabled = false,
                },
            }
        })
    end,
}
