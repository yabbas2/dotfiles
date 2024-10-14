return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require('todo-comments').setup {
            sign_priority = 9,
        }
    end
}
