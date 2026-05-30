# nvim config

A [NvChad](https://github.com/NvChad/NvChad)-based Neovim configuration with LSP, formatting, linting, and LaTeX support.

## Requirements

- [Neovim](https://github.com/neovim/neovim) >= 0.9.0
- [git](https://git-scm.com/) (for plugin management)
- A [Nerd Font](https://www.nerdfonts.com/) (for icons) – e.g. [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases)
- [lazy.nvim](https://github.com/folke/lazy.nvim) (bootstrapped automatically on first launch)
- **Optional** – language-specific tools installed via `mason` or system package manager:
  - LSP servers: `pyright`, `texlab`, `marksman`, `clangd`, `ts_ls`, `cssls`, `html`, `jsonls`
  - Formatters: `black` (Python), `clang-format` (C/C++), `prettier` (JS/TS/MD), `latexindent` (LaTeX)
  - Linters: `pylint` (Python), `eslint_d` (JS/TS)

## Install

1. **Backup** your existing Neovim config:

   ```sh
   mv ~/.config/nvim ~/.config/nvim.bak
   mv ~/.local/share/nvim ~/.local/share/nvim.bak
   mv ~/.local/state/nvim ~/.local/state/nvim.bak
   ```

2. **Clone** this repo:

   ```sh
   git clone https://github.com/<your-username>/nvim.git ~/.config/nvim
   ```

3. **Launch** Neovim – lazy.nvim will bootstrap and install all plugins automatically:

   ```sh
   nvim
   ```

4. **Install LSP servers, formatters, and linters** via Mason (optional):

   ```sh
   :Mason
   ```

   Or let them auto-install on first use.

## Structure

```
~/.config/nvim
├── init.lua              # Entry point; bootstraps lazy.nvim, loads NvChad
├── lazy-lock.json        # Lockfile for plugin versions
├── lua/
│   ├── chadrc.lua        # NvChad UI config (theme, tabufline, etc.)
│   ├── autocmds.lua      # Autocommands (imports NvChad defaults)
│   ├── mappings.lua      # Custom keymaps
│   ├── options.lua       # Editor options (imports NvChad defaults)
│   ├── plugins/
│   │   └── init.lua      # Extra plugins & overrides
│   └── configs/
│       ├── lazy.lua      # lazy.nvim options & performance tweaks
│       ├── lspconfig.lua # LSP server configuration
│       ├── conform.lua   # Formatter config (conform.nvim)
│       └── lint.lua      # Linter config (nvim-lint)
└── .stylua.toml          # StyLua formatting rules
```

## Features

- **Plugin manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) – fast, declarative
- **UI & theme**: [NvChad UI](https://github.com/NvChad/ui) with tokyonight theme
- **LSP**: `nvim-lspconfig` with support for TypeScript, Python, C/C++, LaTeX, HTML/CSS/JSON, Markdown
- **Formatting**: `conform.nvim` – auto-format on save with language-specific formatters
- **Linting**: `nvim-lint` – lint on save (pylint for Python, eslint_d for JS/TS)
- **Completion**: NvChad's blink integration
- **AI**: Codeium (autocomplete)
- **LaTeX**: `luasnip-latex-snippets` + `nabla.nvim` for math preview + `vimtex`
- **Tree-sitter**: syntax highlighting for Lua, VimL, Markdown, LaTeX, HTML, CSS, and more

## Key Mappings

| Mode | Key      | Action                |
|------|----------|-----------------------|
| `n`  | `;`      | Enter command mode    |
| `i`  | `jk`     | Escape insert mode    |
| `n`  | `<leader>p` | Nabla math popup   |
| `n`  | `<leader>mt` | Toggle math preview |

See NvChad defaults for all other mappings (`<leader>w` to save, `<leader>q` to quit, `<Tab>` to cycle buffers, etc.).

## Credits

- [NvChad](https://github.com/NvChad/NvChad) – the framework this config is built on
- [LazyVim starter](https://github.com/LazyVim/starter) – inspiration for the starter template
