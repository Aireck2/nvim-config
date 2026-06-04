require("nvchad.configs.lspconfig").defaults()

local servers = {
  "html",
  "cssls",
  "jsonls",
  "clangd", -- C/C++
  "ts_ls", -- TS, JS, JSX, TSX
  "pyright", -- Python
  "marksman", -- Markdown
  "texlab", -- LaTeX
  "prettypst",
  "terraformls", -- Terraform
  "lua_ls", -- <-- Recomendado: Para configurar tu propio Neovim sin errores de "global vim"
  "bashls", -- <-- Recomendado: Para scripts de terminal (.sh)
  "dockerls", -- <-- Recomendado: Para Dockerfiles
  "yamlls", -- <-- Recomendado: Para archivos YAML / Kubernetes
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
