local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.ensure_installed({
	"sumneko_lua",
	"pyright",
	"rust_analyzer",
})

-- Configure sumneko_lua
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = {
					"vim",
				},
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})

-- Configure pylsp
lsp.configure("pylsp", {
	settings = {
		pylsp = {
			plugins = {
				autopep8 = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
				flake8 = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
			},
		},
	},
})

lsp.nvim_workspace()
lsp.setup()

-- Keybindings
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
