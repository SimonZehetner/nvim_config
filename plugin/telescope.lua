local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
    print "Failed to load telescope"
    return
end

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-e>', function() builtin.oldfiles({only_cwd = true}) end, {})

