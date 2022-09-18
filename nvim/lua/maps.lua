local keymap = vim.keymap
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap=true, silent=true})
vim.g.mapleader = " "
vim.g.localleader = " "

-- vim.api.nvim_set_keymap("", "<Space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap=true, silent=true})

-- Make new tab
keymap.set('n', 'te', ':tabedit<cr>')
keymap.set('n', 'tq', ':tabclose<cr>')
