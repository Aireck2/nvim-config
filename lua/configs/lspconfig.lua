require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "jsonls",
  "tsserver",
  "clangd", -- C/C++
  "ts_ls", -- TS, JS, JSX, TSX
  "pyright", -- Python
  "marksman", -- Markdown
  "texlab", -- LaTeX
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
