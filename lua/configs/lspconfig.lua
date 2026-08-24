require("nvchad.configs.lspconfig").defaults()

-- ============================================================================
-- LSP SERVERS CONFIGURATION
-- ============================================================================
-- To DISABLE a language server you don't need (e.g. Java, JS, C++ when coding Python),
-- simply comment out the corresponding line below with '--'.
-- ============================================================================

local servers = {
  -- --- Core / Neovim Configuration ---
  "lua_ls", -- Lua (Neovim configuration & plugins)

  -- --- Python ---
  "pyright", -- Python type checker and language server

  -- --- Web Development / JavaScript / TypeScript ---
  "ts_ls", -- TypeScript, JavaScript, JSX, TSX
  "html", -- HTML
  "cssls", -- CSS
  "jsonls", -- JSON

  -- --- Systems Programming ---
  "clangd", -- C / C++

  -- --- Documentation, Writing & Academic ---
  "marksman", -- Markdown
  "texlab", -- LaTeX
  "tinymist", -- Typst

  -- --- DevOps, Cloud & Shell ---
  "bashls", -- Shell / Bash scripts (.sh)
  "yamlls", -- YAML / Kubernetes
  "dockerls", -- Dockerfiles
  "terraformls", -- Terraform / HCL

  -- --- Enterprise & JVM (Note: Java LSP is handled by nvim-jdtls in ftplugin/java.lua) ---
  "lemminx", -- XML / Maven pom.xml
}

vim.lsp.enable(servers)

-- ============================================================================
-- CUSTOM LSP SERVER SETTINGS (Optional Overrides)
-- ============================================================================
-- Example for customizing a specific LSP server (e.g., pyright or lua_ls):
--
-- local nvlsp = require "nvchad.configs.lspconfig"
-- require("lspconfig").pyright.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
--   settings = {
--     python = {
--       analysis = {
--         typeCheckingMode = "basic",
--         autoSearchPaths = true,
--         useLibraryCodeForTypes = true,
--       },
--     },
--   },
-- }
