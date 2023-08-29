local status, n = pcall(require, 'catppuccin')

if (not status) then return end

n.setup()
vim.cmd.colorscheme "catppuccin-macchiato"
vim.g.catpuccin_flavour = "macchiato"
-- vim.cmd[[colorscheme catppuccin]]
-- vim.g.catpuccin_flavour = "macchiato"
