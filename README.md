<div align="center">
  <img src="https://raw.githubusercontent.com/NvChad/NvChad.github.io/refs/heads/main/hero.webp" alt="NvChad" width="200" />
</div>

# Aireck2's Neovim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green?style=flat-square&logo=neovim)](https://neovim.io)
[![NvChad](https://img.shields.io/badge/NvChad-v2.5-blue?style=flat-square)](https://nvchad.com)
[![Lua](https://img.shields.io/badge/Lua-darkblue?style=flat-square&logo=lua)](https://lua.org)
[![License: Unlicense](https://img.shields.io/badge/License-Unlicense-lightgray?style=flat-square)](LICENSE)

A modern Neovim configuration built on [NvChad v2.5](https://nvchad.com), with a focus on **LaTeX/Typst editing**, **AI-assisted coding**, and **polyglot LSP support**.

[Features](#features) • [Requirements](#requirements) • [Installation](#installation) • [Configuration](#configuration) • [Disabling Unused Languages](#disabling-unused-languages) • [Key mappings](#key-mappings) • [Post-install](#post-install)

---

## Features

- **NvChad foundation** -- Clean UI with `bearded-arc` theme, statusline, tabufline, and file explorer (`nvim-tree`)
- **LSP everywhere** -- Automatic language support via `neovim/nvim-lspconfig` for Python, TypeScript/JavaScript, C/C++, LaTeX, Typst, HTML, CSS, JSON, Markdown, Terraform, Lua, Bash, Docker, YAML, XML
- **Format on save** -- Auto-formatting with `conform.nvim` (black, prettier, clang-format, latexindent, prettypst, stylua, shfmt, terraform_fmt, google-java-format)
- **Lint on save** -- Real-time linting with `nvim-lint` (pylint, eslint_d, checkstyle)
- **Modern completion** -- `blink.cmp` for fast, built-in completions
- **AI code completion** -- [Codeium](https://codeium.com) integration for AI-powered suggestions
- **LaTeX & Typst toolchain** -- Treesitter highlighting, `vimtex`, `luasnip-latex-snippets`, `nabla.nvim` for inline math preview, and `tinymist`
- **Treesitter** -- Syntax highlighting for Python, Lua, VimL, Markdown, LaTeX, BibTeX, Typst, C/C++, JavaScript, TypeScript, JSON, YAML, Bash, Terraform, Go, Rust, Java, and more
- **Plugin manager** -- `lazy.nvim` with aggressive startup optimization
- **Mason** -- Auto-installs language servers, linters, and formatters

## Requirements

- [Neovim](https://neovim.io) >= 0.9.0 (tested with 0.10+ / 0.12+)
- [Git](https://git-scm.com) 2.19+
- A [Nerd Font](https://www.nerdfonts.com) (for icons)
- `make`, `gcc`, and `ripgrep` (for `telescope.nvim` and `nvim-treesitter`)

## Installation

> [!IMPORTANT]
> This configuration **replaces** your existing Neovim configuration.
> Back up your current config before proceeding:

```bash
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

**Clone the repository:**

```bash
git clone https://github.com/Aireck2/nvim-config ~/.config/nvim
```

**Start Neovim:**

```bash
nvim
```

lazy.nvim bootstraps automatically on first launch. All plugins will be installed and configured. Restart Neovim once the installation completes.

## Configuration

The configuration is structured in `lua/`:

| Path | Purpose |
|---|---|
| `init.lua` | Entry point -- bootstraps lazy.nvim, loads NvChad + user plugins |
| `lua/chadrc.lua` | NvChad UI options (theme, dashboard, tabufline) |
| `lua/mappings.lua` | Custom user keymaps |
| `lua/options.lua` | Neovim options (delegates to NvChad defaults) |
| `lua/autocmds.lua` | Autocommands (delegates to NvChad defaults) |
| `lua/plugins/init.lua` | User plugin specifications |
| `lua/configs/lazy.lua` | lazy.nvim configuration and performance tuning |
| `lua/configs/lspconfig.lua` | LSP server list & configuration |
| `lua/configs/conform.lua` | Formatting rules per filetype |
| `lua/configs/lint.lua` | Linting rules per filetype |
| `ftplugin/java.lua` | JDTLS launcher & workspace configuration for Java |

### Enabled LSP Servers

| Server | File types |
|---|---|
| `pyright` | Python |
| `ts_ls` | TypeScript, JavaScript, JSX, TSX |
| `clangd` | C, C++ |
| `texlab` | LaTeX |
| `tinymist` | Typst |
| `marksman` | Markdown |
| `lua_ls` | Lua |
| `bashls` | Bash / Shell |
| `yamlls` | YAML |
| `terraformls` | Terraform / HCL |
| `dockerls` | Dockerfile |
| `html` / `cssls` / `jsonls` | Web languages |
| `lemminx` | XML |
| `jdtls` | Java (via `ftplugin/java.lua`) |

### Formatters (auto on save)

| File type | Formatter |
|---|---|
| Python | `black` |
| JavaScript / TypeScript | `prettier` |
| C / C++ | `clang-format` |
| Markdown / JSON / YAML | `prettier` |
| LaTeX | `latexindent` |
| Typst | `prettypst` |
| Lua | `stylua` |
| Shell | `shfmt` |
| Terraform | `terraform_fmt` |
| Java | `google_java_format` |

### Linters (on save)

| File type | Linter |
|---|---|
| Python | `pylint` |
| JavaScript / TypeScript | `eslint_d` |
| Java | `checkstyle` |

---

## Disabling Unused Languages

All language tools in this configuration are categorized by ecosystem. If you are coding in **Python** (or any single language) and do not want Neovim running background LSP servers, linters, formatters, or parsers for **Java**, **JavaScript/TypeScript**, **C++**, or **LaTeX**, you can disable them cleanly in 4 steps.

### Step 1: Disable Language Servers (`lua/configs/lspconfig.lua`)

In `lua/configs/lspconfig.lua`, simply comment out the servers you do not need:

```lua
local servers = {
  -- --- Core / Neovim ---
  "lua_ls",

  -- --- Python (Keep enabled) ---
  "pyright",

  -- --- Web Development (Commented out) ---
  -- "ts_ls",
  -- "html",
  -- "cssls",
  -- "jsonls",

  -- --- Systems Programming (Commented out) ---
  -- "clangd",

  -- --- Documents & Academic (Commented out) ---
  -- "marksman",
  -- "texlab",
  -- "tinymist",

  -- --- Enterprise & JVM (Commented out) ---
  -- "lemminx",
}

vim.lsp.enable(servers)
```

---

### Step 2: Disable Formatters (`lua/configs/conform.lua`)

In `lua/configs/conform.lua`, comment out the filetypes you don't want auto-formatted on save:

```lua
local options = {
  formatters_by_ft = {
    -- --- Core / Lua ---
    lua = { "stylua" },

    -- --- Python (Keep enabled) ---
    python = { "black" },

    -- --- Web Development (Commented out) ---
    -- javascript = { "prettier" },
    -- typescript = { "prettier" },

    -- --- Systems Programming (Commented out) ---
    -- cpp = { "clang-format" },

    -- --- Java (Commented out) ---
    -- java = { "google_java_format" },
  },
}
```

---

### Step 3: Disable Linters (`lua/configs/lint.lua`)

In `lua/configs/lint.lua`, comment out the linters for languages you are not developing in:

```lua
local lint = require "lint"

lint.linters_by_ft = {
  -- --- Python (Keep enabled) ---
  python = { "pylint" },

  -- --- Web Development (Commented out) ---
  -- javascript = { "eslint_d" },
  -- typescript = { "eslint_d" },

  -- --- Java (Commented out) ---
  -- java = { "checkstyle" },
}
```

---

### Step 4: Disable Mason Packages & Plugins (`lua/plugins/init.lua`)

In `lua/plugins/init.lua`, adjust Mason's `ensure_installed` and plugin specifications:

```lua
-- In Mason: comment out packages you do not want auto-installed
{
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "tree-sitter-cli",
      -- "tinymist",
      -- "prettypst",
      -- "jdtls",
      -- "google-java-format",
      -- "checkstyle",
      -- "lemminx",
    },
  },
},

-- In Java IDE Suite: comment out nvim-jdtls if not coding Java
-- {
--   "mfussenegger/nvim-jdtls",
--   ft = { "java" },
-- },
```

> [!NOTE]
> `ftplugin/java.lua` is a filetype plugin that only loads when you open a `.java` file. It will never run or consume resources when you are editing `.py` files. However, commenting out `nvim-jdtls` in `lua/plugins/init.lua` prevents the plugin from being downloaded or loaded altogether.

---

## Key mappings

| Mode | Keys | Action |
|---|---|---|
| Normal | `;` | Enter command mode (`:`) |
| Insert | `jk` | Exit insert mode (`<Esc>`) |
| Normal / Visual | `<leader>fm` | Format buffer or range with Conform |
| Normal / Insert / Visual | `<C-s>` | Save file (`:w`) |

All standard NvChad mappings apply:
- `<leader>e` -- Toggle file explorer (`nvim-tree`)
- `<leader>ff` -- Find files (`Telescope`)
- `<leader>fw` -- Live grep (`Telescope`)
- `<leader>fb` -- Find buffers (`Telescope`)
- `<leader>th` -- Theme selector
- `<leader>x` -- Close current buffer
- `<Tab>` / `<S-Tab>` -- Cycle next / previous buffer
- `<leader>p` -- Nabla math preview popup
- `<leader>mt` -- Toggle Nabla virtual math text

## Post-install

1. **Install LSP servers & tools** -- Run `:Mason` to manage LSP servers, linters, and formatters
2. **Codeium** -- Run `:Codeium Auth` to authenticate your Codeium account for AI completions
3. **Treesitter** -- Run `:TSInstall all` (or `:TSUpdate`) to manage language parsers

> [!TIP]
> To customize the theme or UI options, edit `lua/chadrc.lua`.
