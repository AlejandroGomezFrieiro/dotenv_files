set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
set relativenumber
set background=dark
lua <<EOF
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", {noremap=true, silent=true})
vim.g.mapleader = " "
vim.g.localleader = " "

vim.api.nvim_set_keymap('n', '<Leader>n', ":NvimTreeToggle<cr>", {silent=true})
EOF
call plug#begin()

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
" Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'voldikss/vim-floaterm'
" Color scheme used in the GIFs!
Plug 'arcticicestudio/nord-vim'
"Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'untitled-ai/jupyter_ascending.vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'glepnir/dashboard-nvim'
Plug 'edluffy/hologram.nvim'
Plug 'folke/which-key.nvim'
Plug 'kylechui/nvim-surround'
Plug 'numToStr/Comment.nvim'

Plug 'ggandor/lightspeed.nvim'
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ThePrimeagen/refactoring.nvim'
Plug 'danymat/neogen'
Plug 'L3MON4D3/LuaSnip'
" Plug 'filipdutescu/renamer.nvim'
call plug#end()


let g:catppuccin_flavour = "macchiato" " latte, frappe, macchiato, mocha

lua << EOF
require('hologram').setup{
    auto_display = true -- WIP automatic markdown image display, may be prone to breaking
}
EOF

lua <<EOF
 require("neogen").setup {
    snippet_engine = "luasnip",
    enabled = true,
    languages = {
      lua = {
        template = {
          annotation_convention = "ldoc",
        },
      },
      python = {
        template = {
          annotation_convention = "google_docstrings",
        },
      },
      rust = {
        template = {
          annotation_convention = "rustdoc",
        },
      },
      javascript = {
        template = {
          annotation_convention = "jsdoc",
        },
      },
      typescript = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
      typescriptreact = {
        template = {
          annotation_convention = "tsdoc",
        },
      },
    },
  }
EOF

lua <<EOF
require('nvim-tree').setup()
EOF


lua << EOF
require('Comment').setup()
EOF

lua << EOF
require("catppuccin").setup()
EOF

colorscheme catppuccin " magma nvim configuration set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c
lua <<EOF
require'lspconfig'.pyright.setup{
}
EOF

lua << EOF
require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
EOF

lua << EOF
local whichkey = require "which-key"
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
EOF

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local cmp = require'cmp'
local neogen = require 'neogen'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

lua <<EOF
local actions = require('telescope.actions')
local telescope = require('telescope')

telescope.setup()
EOF

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua <<EOF
require'lspconfig'.pyright.setup{}
EOF
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

" inoremap <silent> <F2> <cmd>lua require('renamer').rename()<cr>
" nnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
" vnoremap <silent> <leader>rn <cmd>lua require('renamer').rename()<cr>
nnoremap <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
