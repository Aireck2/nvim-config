# Changelog

## v1.1.0 (2026-06-04)

### Features

- **conform**: add terraform, lua, sh, yaml formatters
- **lspconfig**: add terraformls, lua_ls, bashls, dockerls, yamlls, prettypst
- **treesitter**: add python, cpp, js, ts, go, rust and more parsers

### Bug Fixes

- **treesitter**: restore valid tree-sitter parsers (were incorrectly replaced with formatter/LSP names)

## v1.0.0 (2026-06-04)

### Features

- Initial release with NvChad-based configuration
- LSP support for TypeScript, Python, C/C++, LaTeX, Markdown, HTML, CSS, JSON
- Format on save with conform.nvim (prettier, black, clang-format, latexindent)
- Lint on save with nvim-lint (eslint_d, pylint)
- Modern completion with blink.cmp
- AI code completion with Codeium
- LaTeX toolchain (vimtex, luasnip-latex-snippets, nabla.nvim)
- Treesitter syntax highlighting
- lazy.nvim plugin manager
- Mason binary installer
