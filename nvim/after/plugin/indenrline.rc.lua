local status, indentline = pcall(require, 'indentline')

if not status then return end

indentline.setup()
