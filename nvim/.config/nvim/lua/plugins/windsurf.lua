return {
    "Exafunction/windsurf.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("codeium").setup({
            enable_chat = false,
            enable_cmp_source = false,
            workspace_root = {
                use_lsp = true,
                find_root = nil,
                paths = {
                    ".git",
                    ".hg",
                    ".svn",
                    "package.json",
                }
            },
            virtual_text = {
                enabled = true,
                manual = false,
                filetypes = {
                    codecompanion = false,
                    snacks_picker_input = false,
                    markdown = false,
                },
                default_filetype_enabled = true,
                accept_fallback = nil,
                key_bindings = {
                    accept = "<A-a>",
                    accept_word = false,
                    accept_line = false,
                    clear = "A-e",
                    next = "<A-]>",
                    prev = "<A-[>",
                }
            }
        })
    end
}
