
<div align="center">
  <img src="https://raw.githubusercontent.com/NvChad/NvChad.github.io/refs/heads/main/hero.webp" alt="NvChad" width="200" />
</div>

# Aireck2's Neovim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.9%2B-green?style=flat-square&logo=neovim)](https://neovim.io)
[![NvChad](https://img.shields.io/badge/NvChad-v2.5-blue?style=flat-square)](https://nvchad.com)
[![Lua](https://img.shields.io/badge/Lua-darkblue?style=flat-square&logo=lua)](https://lua.org)
[![License: Unlicense](https://img.shields.io/badge/License-Unlicense-lightgray?style=flat-square)](LICENSE)

A modern Neovim configuration built on [NvChad v2.5](https://nvchad.com), with a focus on **LaTeX editing**, **AI-assisted coding**, and **polyglot LSP support**.

[Features](#features) • [Requirements](#requirements) • [Installation](#installation) • [Configuration](#configuration) • [Key mappings](#key-mappings) • [Post-install](#post-install)

---

## Features

- **NvChad foundation** -- Clean UI with `tokyonight` theme, statusline, tabufline, and file explorer
- **LSP everywhere** -- Automatic language support via `neovim/nvim-lspconfig` for TypeScript, Python, C/C++, LaTeX, HTML, CSS, JSON, Markdown, Terraform, Lua, Bash, Docker, YAML
- **Format on save** -- Auto-formatting with `conform.nvim` (prettier, black, clang-format, latexindent, stylua, shfmt, terraform_fmt)
- **Lint on save** -- Real-time linting with `nvim-lint` (eslint_d, pylint)
- **Modern completion** -- `blink.cmp` for fast, built-in completions
- **AI code completion** -- [Codeium](https://codeium.com) integration for AI-powered suggestions
- **LaTeX toolchain** -- Treesitter highlighting, `vimtex`, `luasnip-latex-snippets`, `nabla.nvim` for inline math preview
- **Treesitter** -- Syntax highlighting for Lua, VimL, Markdown, LaTeX, BibTeX, Python, C/C++, JavaScript, TypeScript, JSON, YAML, Bash, Terraform, Go, Rust, and more
- **Plugin manager** -- `lazy.nvim` with aggressive startup optimization (21 built-in plugins disabled)
- **Mason** -- Auto-installs `tree-sitter-cli` and other LSP/tool binaries

## Requirements

- [Neovim](https://neovim.io) >= 0.9.0
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
| `lua/mappings.lua` | Custom keymaps |
| `lua/options.lua` | Neovim options (delegates to NvChad defaults) |
| `lua/autocmds.lua` | Autocommands (delegates to NvChad defaults) |
| `lua/plugins/init.lua` | User plugin specifications |
| `lua/configs/lazy.lua` | lazy.nvim configuration and performance tuning |
| `lua/configs/lspconfig.lua` | LSP server list |
| `lua/configs/conform.lua` | Formatting rules per filetype |
| `lua/configs/lint.lua` | Linting rules per filetype |

### Enabled LSP Servers

| Server | File types |
|---|---|
| `ts_ls` | TypeScript, JavaScript, JSX, TSX |
| `pyright` | Python |
| `clangd` | C, C++ |
| `texlab` | LaTeX |
| `marksman` | Markdown |
| `lua_ls` | Lua |
| `bashls` | Bash |
| `yamlls` | YAML |
| `terraformls` | Terraform |
| `dockerls` | Dockerfile |
| `prettypst` | Typst |
| `html` / `cssls` / `jsonls` | Web languages |

### Formatters (auto on save)

| File type | Formatter |
|---|---|
| Python | `black` |
| C++ | `clang-format` |
| JavaScript / TypeScript | `prettier` |
| Markdown | `prettier` |
| LaTeX | `latexindent` |
| Lua | `stylua` |
| Terraform | `terraform_fmt` |
| Shell | `shfmt` |
| YAML / JSON | `prettier` |

### Linters (on save)

| File type | Linter |
|---|---|
| Python | `pylint` |
| JavaScript / TypeScript | `eslint_d` |

## Key mappings

| Mode | Keys | Action |
|---|---|---|
| Normal | `;` | Enter command mode (`:`) |
| Insert | `jk` | Exit insert mode (`<Esc>`) |

All standard NvChad mappings apply:
- `<leader>e` -- Toggle file explorer
- `<leader>ff` -- Find files (Telescope)
- `<leader>fw` -- Live grep (Telescope)
- `<leader>p` -- Nabla math preview popup
- `<leader>mt` -- Toggle Nabla virtual math text

## Post-install

1. **Install LSP servers** -- Run `:Mason` and install any additional LSP servers you need
2. **Install formatters** -- Ensure `black`, `prettier`, `clang-format`, and `latexindent` are available on your `$PATH`
3. **Codeium** -- Run `:Codeium Auth` to authenticate your Codeium account for AI completions
4. **Treesitter** -- Run `:TSInstall all` to install additional language parsers

> [!TIP]
> To customize the theme or UI options, edit `lua/chadrc.lua`.
> To add new plugins, add their specifications to `lua/plugins/init.lua`.
