local status, quarto = pcall(require, 'quarto')

if (not status) then return end

-- quarto.setup()
quarto.setup({
    debug = false,
    closePreviewOnExit = true,
    lspFeatures = {
        enabled = true,
        languages = {'r', 'python', 'julia', 'bash', 'lua'},
        chunks = 'curly',
        diagnostics = {
            enabled = true,
            triggers = { "BufWritePost"}
        },
        completion = {
            enabled = true
        },
    },
    keymap = {
        hover = 'K',
        definition = 'gd'
    },
})
