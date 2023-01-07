local status_ok, vgit = pcall(require, "vgit")
if not status_ok then
	return
end

vgit.setup({
	settings = {
		hls = {
			GitSignsAdd = {
				fg = "#D7FFAF",
			},
			GitSignsChange = {
				fg = "#7AA6DA",
			},
			GitSignsDelete = {
				fg = "#E95678",
			},
			GitWordAdd = {
				fg = "#91bf69",
			},
			GitWordDelete = {
				fg = "#bf434f",
			},
		},
		signs = {
			definitions = {
				GitSignsDelete = {
					text = "🢒",
				},
			},
		},
		scene = {
			diff_preference = "split",
			keymaps = {
				quit = "q",
			},
		},
		live_blame = {
			enabled = false,
		},
	},
})

vim.api.nvim_set_keymap("n", "<leader>gd", ":VGit buffer_diff_preview<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gD", ":VGit project_diff_preview<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gp", ":VGit buffer_hunk_preview<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gr", ":VGit buffer_hunk_reset<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>gh", ":VGit buffer_history_preview<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<C-N>", ":VGit hunk_down<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-P>", ":VGit hunk_up<CR>", { noremap = true, silent = true })
