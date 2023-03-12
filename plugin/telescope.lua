local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
    print "Failed to load telescope"
    return
end

vim.keymap.set('n', '<C-e>', function() builtin.oldfiles({only_cwd = true}) end, {})

