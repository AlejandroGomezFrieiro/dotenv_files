local status, whichkey = pcall(require, 'which-key')

if (not status) then return end

whichkey.setup(
{
        window={
            border="single",
            position="bottom",
            },
        })

whichkey.register(
{
        ["w"] = { "<cmd>update!<CR>", "Save" },
        ["q"] = { "<cmd>q!<CR>", "Quit"},

        b = {
            name = "Buffer",
            c = { "<Cmd>bd!<Cr>", "Close current buffer" },
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },
        r = {
            name = "Refactor",
            e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
            f = {
            [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
            "Extract Function to File",
        },
            v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
            i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
            r = { [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]], "Refactor" },
            V = { [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]], "Debug Print Var" },
    },
        c = {
            name = "Code",
            g = { "<cmd>Neogen func<Cr>", "Func Doc" },
            G = { "<cmd>Neogen class<Cr>", "Class Doc" },
},
        f = {
            name = "Fuzzy Find",
            f = { "<cmd>Telescope find_files<Cr>", "Find files"},
            g = { "<cmd>Telescope live_grep<cr>", "Live grep"},
            b = {'<cmd>Telescope buffers<cr>', "Find buffers"},
            h = {'<cmd>Tebescope help_tags<cr>', "Help tags"}
        },
        t = {
            name = "Floaterm",
            t = {"<cmd>:FloatermToggle<CR>", "Toggle terminal"},
        },
--         l = {
--             name="LSPSaga",
--             K = {"<Cmd>Lspsaga hover_doc<cr>", "Hover"},
--             f = {"<Cmd>Lspsaga lsp_finder<cr>", "Find"},
--             i = {"<Cmd>Lspsaga signature_help<cr>", "Signature help"},
--             p = {"<Cmd>Lspsaga preview_definition<cr>", "Preview definition"},
--             r = {"<Cmd>Lspsaga rename<cr>", "Rename"},
--         }
},
{
        mode="n",
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappint
        silent = true, -- use 'silent' when creating keymaps
        noremap = true, -- use 'noremap' when creating keymaps
        nowait = false, -- use 'nowait' when creating keymaps
    }
)
