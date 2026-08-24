-- ============================================================================
-- NVIM-LINT (Asynchronous Linting Configuration)
-- ============================================================================
-- Linters run on `BufWritePost`, `BufReadPost`, and `InsertLeave`.
-- To DISABLE linting for a specific language (e.g. Java, JS when coding Python),
-- comment out or remove the filetype entry from `linters_by_ft` below.
-- ============================================================================

local lint = require "lint"

lint.linters_by_ft = {
  -- --- Python ---
  python = { "pylint" },

  -- --- Web Development / JavaScript / TypeScript ---
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescriptreact = { "eslint_d" },

  -- --- Java ---
  java = { "checkstyle" },
}

-- Autocommand to trigger linting automatically
vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("nvim-lint-auto", { clear = true }),
  callback = function()
    lint.try_lint()
  end,
})
