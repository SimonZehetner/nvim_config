local status_ok_tree, nvim_tree = pcall(require, "nvim-tree")
if not status_ok_tree then
	return
end

nvim_tree.setup({})
