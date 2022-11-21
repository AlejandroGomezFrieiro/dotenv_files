local status, nvim_tree = pcall(require, 'nvim-tree')

if (not status) then return end

nvim_tree.setup()

-- Config keymap
vim.api.nvim_set_keymap('n', '<Leader>n', ":NvimTreeToggle<cr>", {silent=true})
