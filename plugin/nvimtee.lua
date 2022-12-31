local status_ok_tree, nvim_tree = pcall(require, "nvim-tree")
if not status_ok_tree then
    return
end

nvim_tree.setup({})

vim.keymap.set('n', '<leader>e', ":NvimTreeToggle<CR>", {})
vim.keymap.set('n', '<leader>E', ":NvimTreeFindFile<CR>", {})
