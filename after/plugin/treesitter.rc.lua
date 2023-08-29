local status, ts_config = pcall(require, 'nvim-treesitter.configs')
-- local status_objects, ts_objects = pcall(require, 'nvim-treesitter.textobjects')
if not status then return end
-- if not status_objects then return end

-- ts_objects.setup()
ts_config.setup {
ensure_installed = {
    "c",
    "comment",
    "cpp",
    "css",
    "glimmer",
    "go",
    "html",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "jsonc",
    "markdown",
    "lua",
    "python",
    "query",
    "rst",
    "rust",
    "yaml",
    "svelte",
    "tsx",
    "typescript"
  },

  autotag = { enable = true },
  highlight = { enable = vim.g.vscode ~= 1 },
  indent = { enable = true },
  matchup = { enable = true },
  playground = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<Enter>",
      node_incremental = "<Enter>",
      node_decremental = "<BS>",
    },
  },

  textobjects = {
    select = {
      enable = true,
        lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ao"] = "@codechunk.outer",
        ["io"] = "@codechunk.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["<Leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<Leader>A"] = "@parameter.inner",
      },
    },
    move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']c'] = '@codechunk.inner',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[c'] = '@codechunk.inner',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
    lsp_interop = {
      enable = true,
    },
  },}
