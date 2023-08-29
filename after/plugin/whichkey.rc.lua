local status, whichkey = pcall(require, 'which-key')

if (not status) then return end

whichkey.setup(
    {
        window = {
            border = "single",
            position = "bottom",
        },
    })

local function mark_terminal()
    vim.g.slime_last_channel = vim.b.terminal_job_id
    vim.print(vim.g.slime_last_channel)
end

local function set_terminal()
    vim.b.slime_config = { jobid = vim.g.slime_last_channel }
end

local function toggle_slime_tmux_nvim()
    if vim.g.slime_target == 'tmux' then
      pcall(function()
        vim.b.slime_config = nil
        vim.g.slime_default_config = nil
      end
      )
      -- slime, neovvim terminal
      vim.g.slime_target = "neovim"
      vim.g.slime_bracketed_paste = 0
      vim.g.slime_python_ipython = 1
    elseif vim.g.slime_target == 'neovim' then
      pcall(function()
        vim.b.slime_config = nil
        vim.g.slime_default_config = nil
      end
      )
      -- -- slime, tmux
      vim.g.slime_target = 'tmux'
      vim.g.slime_bracketed_paste = 1
      vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
    end
end
whichkey.register(
    {
        ["w"] = { "<cmd>update!<CR>", "Save" },
        q = {
            name = 'quarto',
             a = { ":QuartoActivate<cr>", 'activate' },
              p = { ":lua require'quarto'.quartoPreview()<cr>", 'preview' },
              q = { ":lua require'quarto'.quartoClosePreview()<cr>", 'close' },
              h = { ":QuartoHelp ", 'help' },
              r = { name = 'run',
                r = { ':QuartoSendAbove<cr>', 'to cursor' },
                a = { ':QuartoSendAll<cr>', 'all' },
              },
              e = { ":lua require'otter'.export()<cr>", 'export' },
              E = { ":lua require'otter'.export(true)<cr>", 'export overwrite' },
        },

        m = {
            name = "Markdown",
            c = { "<Cmd>vim.util.lsp.stylize_markdown()<Cr>", "Stylize markdown block code" },
        },
        b = {
            name = "Buffer",
            c = { "<Cmd>bd!<Cr>", "Close current buffer" },
            D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
        },
        r = {
            name = "Refactor",
            b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract block" },
            e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
            f = {
                "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
                "Extract Block to File",
            },
            v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
            i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
            r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor" },
            V = { "<Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>", "Debug Print Var" },
        },
        c = {
            name = "Code",
            g = { "<cmd>Neogen func<Cr>", "Func Doc" },
            G = { "<cmd>Neogen class<Cr>", "Class Doc" },
            d = { "<cmd>Neogen<Cr>", "Doc" },
            c = { ':SlimeConfig<cr>', 'slime config' },
              n = { ':split term://$SHELL<cr>', 'new terminal' },
              p = { ':split term://python<cr>', 'new python terminal' },
              i = { ':split term://ipython<cr>', 'new ipython terminal' },
            t = { toggle_slime_tmux_nvim, "toggle tmux/nvim terminal"},
            m = { mark_terminal, 'mark terminal' },
            s = { set_terminal, 'set terminal' },
        },
        f = {
            name = "Fuzzy Find",
            f = { "<cmd>Telescope find_files<Cr>", "Find files" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            b = { '<cmd>Telescope buffers<cr>', "Find buffers" },
            h = { '<cmd>Tebescope help_tags<cr>', "Help tags" },
            k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
            r = { '<cmd>Telescope lsp_references<cr>', 'references' },
            g = { "<cmd>Telescope live_grep<cr>", "grep" },
          b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
          m = { "<cmd>Telescope marks<cr>", "marks" },
          M = { "<cmd>Telescope man_pages<cr>", "man pages" },
          c = { "<cmd>Telescope git_commits<cr>", "git commits" },
          s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
          d = { "<cmd>Telescope buffers<cr>", "buffers" },
          q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
          l = { "<cmd>Telescope loclist<cr>", "loclist" },
          j = { "<cmd>Telescope jumplist<cr>", "marks" },
          p = { "project" },
},
        -- t = {
        --     name = "Floaterm",
        --     t = { "<cmd>:FloatermToggle<CR>", "Toggle terminal" },
        -- },
        l = {
            name = "LSP",
            K = { "<Cmd>Lspsaga hover_doc<cr>", "Hover" },
            f = { "<Cmd>Lspsaga lsp_finder<cr>", "Find" },
            i = { "<Cmd>Lspsaga signature_help<cr>", "Signature help" },
            P = { "<Cmd>Lspsaga peek_definition<cr>", "Preview definition" },
            a = { "<Cmd>Lspsaga code_action<cr>", "Code action" },
            r = { "<Cmd>Lspsaga rename<cr>", "Rename" },
            p = { "<Cmd>lua vim.lsp.buf.format()<CR>", "Format" }
        }
    },
    {
        mode = "n",
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappint
        silent = true, -- use 'silent' when creating keymaps
        noremap = true, -- use 'noremap' when creating keymaps
        nowait = false, -- use 'nowait' when creating keymaps
    }
)
whichkey.register(
    {
        ['<cr>'] = { '<Plug>SlimeRegionSend', 'run code region' },
          ['<M-j>'] = { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
          ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
          ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
          ['q'] = { ':norm @q<cr>', 'repat q macro' },
          ['<leader>'] = { '<Plug>SlimeRegionSend', 'run code region' },
          ['p'] = { '"_dP', 'replace without overwriting reg' },
        r = {
            name = "Refactor",
            b = { "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>", "Extract block" },
            e = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>", "Extract Function" },
            f = {
                "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
                "Extract Block to File",
            },
            v = { "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>", "Extract Variable" },
            i = { "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", "Inline Variable" },
            r = { "<Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", "Refactor" },
            V = { "<Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>", "Debug Print Var" },
        },
    },
    {
        mode = "v",
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappint
        silent = true, -- use 'silent' when creating keymaps
        noremap = true, -- use 'noremap' when creating keymaps
        nowait = false, -- use 'nowait' when creating keymaps
    }
)
