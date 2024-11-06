return {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function ()
        local function label(path)
            path = path:gsub(os.getenv 'HOME', '~', 1)
            return path:gsub('([a-zA-Z])[a-z0-9]+', '%1') ..
                (path:match '[a-zA-Z]([a-z0-9]*)$' or '')
        end

        local api = require("nvim-tree.api")
        local nvim_tree = require("nvim-tree")

        nvim_tree.setup {
            renderer = {
                indent_markers = {
                    enable = true,
                },
                root_folder_label = label,
                group_empty = label,
            },
            filters = {
                dotfiles = false,
                git_ignored = false,
            },
            trash = {
                cmd = "trash",
                require_confirm = true,
            },
        }

        api.events.subscribe(api.events.Event.FileCreated, function(file)
            vim.cmd("edit " .. file.fname)
        end)
    end,
    keys = {
        { "<leader>bb", "<CMD>lua require('nvim-tree.api').tree.toggle()<CR>", mode = { "n" } }
    }
}
