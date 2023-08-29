local status, otter = pcall(require, 'otter.nvim')
local status_config, otter_config = pcall(require, 'otter.config')

if (not status) then return end

otter.setup()
otter_config.setup()
