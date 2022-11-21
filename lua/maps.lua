local keymap = vim.keymap
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap=true, silent=true})
vim.g.mapleader = " "
vim.g.localleader = " "

-- vim.api.nvim_set_keymap("", "<Space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap=true, silent=true})

-- Make new tab
keymap.set('n', 'te', ':tabedit<cr>')
keymap.set('n', 'tq', ':tabclose<cr>')

vim.api.nvim_set_keymap("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})
