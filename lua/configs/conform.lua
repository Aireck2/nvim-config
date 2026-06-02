local options = {
  formatters_by_ft = {
    python = { "black" },
    cpp = { "clang-format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    markdown = { "prettier" },
    tex = { "latexindent" },
    json = { "prettier" },
    typst = { "prettypst" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
