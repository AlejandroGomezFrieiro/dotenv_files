local status, jupytext = pcall(require, 'jupytext')

if not status then return end

jupytext.setup()
