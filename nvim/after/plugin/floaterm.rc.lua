local status, term = pcall(require, 'floaterm')
if not status then return end

local g = vim.g
g.floaterm_keymap_toggle= '<F12>'
-- vim.cmd([[nnoremap   <silent>   <F7>    :FloatermNew<CR>]])
-- vim.cmd([[tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CRl>]])
-- vim.cmd([[nnoremap   <silent>   <F8>    :FloatermPrev<CR>]])
-- vim.cmd([[tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>]])
-- vim.cmd([[nnoremap   <silent>   <F9>    :FloatermNext<CR>]])
-- vim.cmd([[tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>]])
-- vim.cmd([[nnoremap   <silent>   <F12>   :FloatermToggle<CR>]])
-- vim.cmd([[tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>]])
