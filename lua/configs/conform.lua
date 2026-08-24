-- ============================================================================
-- CONFORM.NVIM (Code Formatting Configuration)
-- ============================================================================
-- Formatters run automatically on buffer save (`BufWritePre`).
-- To DISABLE formatting for a specific language (e.g. Java, JS when coding Python),
-- comment out or remove the filetype entry from `formatters_by_ft` below.
-- ============================================================================

local options = {
  formatters_by_ft = {
    -- --- Core / Lua ---
    lua = { "stylua" },

    -- --- Python ---
    python = { "black" },

    -- --- Web Development / JavaScript / TypeScript ---
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },

    -- --- Systems Programming ---
    cpp = { "clang-format" },
    c = { "clang-format" },

    -- --- Documentation, Writing & Academic ---
    markdown = { "prettier" },
    tex = { "latexindent" },
    typst = { "prettypst" },

    -- --- DevOps, Cloud & Shell ---
    sh = { "shfmt" },
    yaml = { "prettier" },
    yml = { "prettier" },
    terraform = { "terraform_fmt" },

    -- --- Enterprise / Java ---
    java = { "google_java_format" },
  },

  format_on_save = {
    -- Timeout in milliseconds for synchronous formatting on save
    timeout_ms = 500,
    -- Fallback to LSP formatting if external formatter is unavailable
    lsp_format = "fallback",
    lsp_fallback = true,
  },
}

return options
