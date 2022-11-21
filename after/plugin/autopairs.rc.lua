local status, autopairs = pcall(require, 'nvim-autopairs')

if not status then return end

autopairs.setup {
    disable_filetype = {'TelescopePrompt', "guihua", "guihua_rust", "clap_input"},

}

