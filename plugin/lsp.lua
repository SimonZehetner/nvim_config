local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.ensure_installed {
    "sumneko_lua",
    "pyright",
    "rust_analyzer",
}

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

lsp.nvim_workspace()
lsp.setup()

