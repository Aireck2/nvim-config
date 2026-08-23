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
    terraform = { "terraform_fmt" },
    lua = { "stylua" },
    sh = { "shfmt" }, -- Agregado para scripts de terminal (.sh)
    yaml = { "prettier" },
    yml = { "prettier" },
    java = { "google_java_format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
