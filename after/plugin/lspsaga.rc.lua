local status, lspsaga = pcall(require, 'lspsaga');

if not status then return end

lspsaga.setup( {
    server_filetype_map = {}
})
