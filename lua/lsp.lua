require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = { 'pylsp', 'lua_ls', 'rust_analyzer', 'clangd' },
})

local lspconfig = require("lspconfig")

local custom_attach = function(client, bufnr)
end


lspconfig.pylsp.setup {
    on_attach = custom_attach,
    settings = {
        pylsp = {
            plugins = {
                -- formatter options
                black = { enabled = true },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                -- linter options
                pylint = { enabled = true, executable = "pylint" },
                ruff = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                -- type checker
                pylsp_mypy = {
                    enabled = true,
                    report_progress = true,
                    live_mode = false
                },
                -- auto-completion options
                jedi_completion = { fuzzy = true },
                -- import sorting
                isort = { enabled = true },
            },
        },
    },
}


lspconfig.clangd.setup {
    on_attach = custom_attach,
}

lspconfig.rust_analyzer.setup {
    on_attach = custom_attach,
    settings = {
        ['rust-analyzer'] = {
            diagnostics = {
                enable = false;
            }
        }
    }
}

lspconfig.lua_ls.setup {
    on_attach = custom_attach,
    settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
}

