
local actions_status, actions = pcall(require,'telescope.actions')

local status, telescope = pcall(require, 'telescope')

if not action_status then return end
if not status then return end

telescope.setup()
