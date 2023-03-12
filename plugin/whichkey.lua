local status_ok, wk = pcall(require, "whichkey_setup")
if not status_ok then
	return
end

wk.config({
	hide_statusline = false,
	default_keymap_settings = {
		silent = true,
		noremap = true,
	},
	default_mode = "n",
})

local keymap = {
	b = { "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
	e = { "<Cmd>NvimTreeToggle<CR>", "Toggle Tree" },
	E = { "<Cmd>NvimTreeFindFile<CR>", "Find File in Tree" },
	f = {
		name = "+Find",
		b = { "<Cmd>Telescope find_buffers<CR>", "Buffers" },
		f = { "<Cmd>Telescope find_files<CR>", "Files" },
		g = { "<Cmd>Telescope live_grep<CR>", "Grep" },
		h = { "<Cmd>Telescope help_tags<CR>", "Help" },
		k = { "<Cmd>Telescope keymaps<CR>", "Key Maps" },
	},
	g = {
		name = "+Git",
		c = { "<Cmd>VGit project_commit_preview<CR>", "Commit" },
		d = { "<Cmd>VGit buffer_diff_preview<CR>", "Diff Buffer" },
		D = { "<Cmd>VGit project_diff_preview<CR>", "Diff Project" },
		h = { "<Cmd>VGit buffer_history_preview<CR>", "Show Buffer History" },
		p = { "<Cmd>VGit buffer_hunk_preview<CR>", "Diff Hunk" },
		P = { "<Cmd>VGit project_hunks_preview<CR>", "Show unstaged Hunks" },
		r = { "<Cmd>VGit buffer_hunk_reset<CR>", "Reset Hunk" },
		R = { "<Cmd>VGit buffer_reset<CR>", "Reset Buffer" },
		s = { "<Cmd>VGit buffer_hunk_stage<CR>", "Stage Hunk" },
		S = { "<Cmd>VGit buffer_stage<CR>", "Stage Buffer" },
	},
	l = {
		name = "+LSP",
		f = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format" },
	},
	t = {
		name = "+Toggle",
		h = { "<Cmd>lua _htop_toggle()<CR>", "htop" },
		p = { "<Cmd>lua _ipython_toggle()<CR>", "Python" },
	},
	q = { "<Cmd>q<CR>", "Quit" },
	Q = { "<Cmd>q!<CR>", "Force Quit" },
	w = { "<Cmd>w<CR>", "Write" },
	W = { "<Cmd>wq<CR>", "Write and Quit" },
}

wk.register_keymap("leader", keymap)
