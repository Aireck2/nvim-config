-- ============================================================================
-- USER PLUGIN SPECIFICATIONS (lazy.nvim)
-- ============================================================================
-- Note: NvChad already includes core plugins (nvim-tree, telescope, which-key,
-- gitsigns, indent-blankline, etc.). Add or customize plugins here.
-- ============================================================================

return {
  -- ==========================================================================
  -- 1. CODE FORMATTING (conform.nvim)
  -- ==========================================================================
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Auto-format on save
    opts = require "configs.conform",
  },

  -- ==========================================================================
  -- 2. LSP CLIENT CONFIGURATION (nvim-lspconfig)
  -- ==========================================================================
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- ==========================================================================
  -- 3. ASYNCHRONOUS LINTER (nvim-lint)
  -- ==========================================================================
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require "configs.lint"
    end,
  },

  -- ==========================================================================
  -- 4. PACKAGE MANAGEMENT (mason.nvim)
  -- ==========================================================================
  -- Automatically install LSP servers, linters, formatters, and debuggers.
  -- Comment out any tools you don't need installed.
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- Core / CLI
        "tree-sitter-cli",

        -- Python (Uncomment if you want Mason to manage them)
        -- "pyright",
        -- "black",
        -- "pylint",

        -- Typst / LaTeX
        "tinymist",
        "prettypst",

        -- Java & Enterprise (Comment out if not doing Java development)
        "jdtls",
        "google-java-format",
        "checkstyle",
        "lemminx",
      },
    },
  },

  -- ==========================================================================
  -- 5. SYNTAX HIGHLIGHTING & PARSERS (nvim-treesitter)
  -- ==========================================================================
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        -- Core / Editor
        "lua",
        "vim",
        "vimdoc",
        "query",

        -- Python
        "python",

        -- Web & Frontend
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",

        -- Systems Programming
        "c",
        "cpp",
        "go",
        "rust",

        -- Documentation & Academic
        "markdown",
        "markdown_inline",
        "latex",
        "bibtex",
        "typst",

        -- DevOps & Shell
        "bash",
        "terraform",
        "hcl",
        "dockerfile",

        -- Java (Comment out if not doing Java)
        "java",
      },
      highlight = {
        enable = true,
      },
    },
  },

  -- ==========================================================================
  -- 6. COMPLETION ENGINE (blink.cmp)
  -- ==========================================================================
  { import = "nvchad.blink.lazyspec" },

  -- ==========================================================================
  -- 7. AI CODE COMPLETION (Codeium)
  -- ==========================================================================
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },

  -- ==========================================================================
  -- 8. LATEX & MATH DOCUMENTATION SUITE (Optional)
  -- ==========================================================================
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    ft = { "tex", "markdown" },
    dependencies = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = function()
      require("luasnip-latex-snippets").setup {
        use_treesitter = true,
      }
      require("luasnip").config.set_config {
        enable_autosnippets = true,
      }
    end,
  },

  {
    "jbyuki/nabla.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    lazy = true,
    keys = function()
      return {
        {
          "<leader>p",
          ':lua require("nabla").popup()<cr>',
          desc = "Nabla Popup Math Preview",
        },
        {
          "<leader>mt",
          ':lua require("nabla").toggle_virt()',
          desc = "Toggle Math Virtual Text Preview",
        },
      }
    end,
  },

  -- ==========================================================================
  -- 9. JAVA IDE SUITE (nvim-jdtls)
  -- ==========================================================================
  -- Automatically activates only for Java files (`ft = { "java" }`).
  -- Handled by ftplugin/java.lua. Comment this out if not using Java.
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
  },
}
