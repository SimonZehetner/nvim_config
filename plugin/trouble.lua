local status_ok, trouble = pcall(require, "trouble")
if not status_ok then
	return
end

trouble.setup({})

vim.keymap.set("n", "<F6>", ":TroubleToggle<CR>", { silent = true, noremap = true })
