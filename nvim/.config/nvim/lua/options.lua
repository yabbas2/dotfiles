vim.opt.clipboard = 'unnamedplus'   -- use system clipboard
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Tab
vim.opt.tabstop = 4                 -- number of visual spaces per TAB
vim.opt.softtabstop = 4             -- number of spacesin tab when editing
vim.opt.shiftwidth = 4              -- insert 4 spaces on a tab
vim.opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
vim.opt.number = true               -- show absolute number
vim.opt.relativenumber = false       -- add numbers to each line on the left side
vim.opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
vim.opt.splitbelow = true           -- open new vertical split bottom
vim.opt.splitright = true           -- open new horizontal splits right
vim.opt.termguicolors = true        -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint
vim.opt.conceallevel = 0
vim.opt.cmdheight = 0

-- Searching
vim.opt.incsearch = true            -- search as characters are entered
vim.opt.hlsearch = false            -- do not highlight matches
vim.opt.ignorecase = true           -- ignore case in searches by default
vim.opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Spell checker
-- vim.opt.spell = true
-- vim.opt.spelllang = 'en_us'

-- Space as leaderkey
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.keymap.set("v", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable some builtin plugins
vim.g.loaded_gzip = 1
vim.g.loaded_tar = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zip = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_getscript = 1
vim.g.loaded_getscriptPlugin = 1
vim.g.loaded_vimball = 1
vim.g.loaded_vimballPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_logiPat = 1
vim.g.loaded_rrhelper = 1
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_remote_plugins = 1

-- Status column
vim.o.foldcolumn = "1"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.o.statuscolumn = '%=%s%=%l%{foldlevel(v:lnum) > foldlevel(v:lnum - 1) ? (foldclosed(v:lnum) == -1 ? "▼" : "▶") : " "} '
vim.o.signcolumn = 'yes:2'
vim.fn.sign_define("DiagnosticSignHint", { text = "󰝶", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignError", { text = "", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "", linehl = "", numhl = "" })
