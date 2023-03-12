local status_ok_dapui, dapui = pcall(require, "dapui")
if status_ok_dapui then
	dapui.setup()
end

local status_ok_dap_vt, dap_vt = pcall(require, "nvim-dap-virtual-text")
if status_ok_dap_vt then
	dap_vt.setup()
end

local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
	return
end

vim.keymap.set("n", "<F9>", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<S-F7>", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<S-F8>", ":lua require'dap'.step_out()<CR>")

if status_ok_dapui then
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited["dapui_config"] = function()
		dapui.close()
	end
end

local status_ok_python, dap_python = pcall(require, "dap-python")
if status_ok_python then
	dap_python.setup()
end

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {},
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
