vim.g.catpuccin_flavour = "macchiato"
local status, n = pcall(require, 'catppuccin')

if (not status) then return end

n.setup()
vim.cmd[[colorscheme catppuccin]]
