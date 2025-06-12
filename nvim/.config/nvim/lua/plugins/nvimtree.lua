return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    config = function()
        local api = require("nvim-tree.api")
        local nvim_tree = require("nvim-tree")

        ---@diagnostic disable-next-line: unused-local
        local function label(path)
            return "File Explorer"
        end
        local function my_on_attach(bufnr)
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end
            -- custom mappings
            vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
            vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
            vim.keymap.set("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
            vim.keymap.set("n", "<C-v>", api.node.open.horizontal, opts("Open: Horizontal Split"))
            vim.keymap.set("n", "<C-x>", api.node.open.vertical, opts("Open: Vertical Split"))
            vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
            vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
            vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
            vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
            vim.keymap.set("n", "a", api.fs.create, opts("Create File Or Directory"))
            vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
            vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
            vim.keymap.set("n", "t", api.fs.trash, opts("Trash"))
            vim.keymap.set("n", "s", api.node.run.system, opts("Run System"))
            vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
            vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
            vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
            vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
            vim.keymap.set("n", "q", api.tree.close, opts("Close"))
            vim.keymap.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
            vim.keymap.set("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
            vim.keymap.set("n", "bx", api.marks.bulk.move, opts("Move Bookmarked"))
            vim.keymap.set("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
            vim.keymap.set("n", "f", api.live_filter.start, opts("Live Filter: Start"))
            vim.keymap.set("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
            vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
            vim.keymap.set("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
            vim.keymap.set("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
            vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
            vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
            vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
            vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
            vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
            vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
            vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
        end


        nvim_tree.setup {
            renderer = {
                indent_markers = {
                    enable = true,
                },
                decorators = {
                    "Open",
                    "Bookmark",
                    "Copied",
                    "Cut",
                    "Hidden",
                },
                highlight_opened_files = "none",
                highlight_hidden = "name",
                highlight_bookmarks = "name",
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
            on_attach = my_on_attach,
            hijack_cursor = true,
            view = {
                signcolumn = 'no',
            },
            ui = {
                confirm = {
                    default_yes = true,
                },
            },
        }

        api.events.subscribe(api.events.Event.FileCreated, function(file)
            vim.cmd("edit " .. file.fname)
        end)

        vim.cmd([[hi NvimTreeBookmarkHL guisp=orange  gui=underline]])
    end,
    keys = {
        { "<leader>nt", "<CMD>lua require('nvim-tree.api').tree.toggle()<CR>", mode = "n" }
    }
}
