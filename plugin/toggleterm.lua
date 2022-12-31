local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

toggleterm.setup({
	open_mapping = [[<c-t>]],
	direction = "float",
})

local Terminal = require("toggleterm.terminal").Terminal

local ipython = Terminal:new({cmd = "ipython", hidden = true})
function _ipython_toggle()
    ipython:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _ipython_toggle()<CR>", {noremap = true, silent = true})

local htop = Terminal:new({cmd = "htop", hidden = true})
function _htop_toggle()
    htop:toggle()
end
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _htop_toggle()<CR>", {noremap = true, silent = true})
