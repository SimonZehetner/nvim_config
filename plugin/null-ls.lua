local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    return
end

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.jsonlint,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.shellcheck,
        null_ls.builtins.formatting.black.with({extra_args = {"--line-length", "110"}}),
        null_ls.builtins.formatting.isort.with({extra_args = {"--profile", "black"}}),
        null_ls.builtins.formatting.cbfmt,
        null_ls.builtins.formatting.pg_format,
        null_ls.builtins.formatting.rustfmt,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.xmllint,
    },
})
