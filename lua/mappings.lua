-- ============================================================================
-- USER KEY MAPPINGS
-- ============================================================================
-- Inherits default NvChad keymaps:
--   <leader>e   - Toggle File Explorer (nvim-tree)
--   <leader>ff  - Find Files (Telescope)
--   <leader>fw  - Live Grep (Telescope)
--   <leader>fb  - Find Buffers (Telescope)
--   <leader>th  - Toggle Themes (nvchad.themes)
--   <leader>x   - Close Buffer (tabufline)
--   <Tab>       - Next Buffer
--   <S-Tab>     - Previous Buffer
--   <leader>fm  - Format current buffer (Conform)
-- ============================================================================

require "nvchad.mappings"

local map = vim.keymap.set

-- Command mode convenience
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- Format manually using Conform (if auto-format on save is disabled)
map({ "n", "v" }, "<leader>fm", function()
  require("conform").format { lsp_format = "fallback", timeout_ms = 1000 }
end, { desc = "Format buffer or range (Conform)" })

-- Quick Save
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
