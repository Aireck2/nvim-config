return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    -- This ensures it loads for both LaTeX and Markdown files
    ft = { "tex", "markdown" },
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require("luasnip-latex-snippets").setup {
        use_treesitter = true,
      }
      -- This allows snippets to expand when you press Tab
      require("luasnip").config.set_config {
        enable_autosnippets = true,
      }
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "tree-sitter-cli" } },
  },

  {
    "jbyuki/nabla.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-neo-tree/neo-tree.nvim",
      "williamboman/mason.nvim",
    },
    lazy = true,

    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = { "latex" },
        auto_install = true,
        sync_install = false,
      }
    end,

    keys = function()
      return {
        {
          "<leader>p",
          ':lua require("nabla").popup()<cr>',
          desc = "NablaPopUp",
        },
        {
          "<leader>mt",
          ':lua require("nabla").toggle_virt()',
          desc = "Toogle Math Preview",
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
        "latex",
        "bibtex",
        "typst",
        "tinymist",
      },
      highlight = {
        enable = true,
      },
    },
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },
}
