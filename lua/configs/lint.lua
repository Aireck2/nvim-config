local lint = require "lint"

lint.linters_by_ft = {
  python = { "pylint" },
  javascript = { "eslint_d" },
  typescript = { "eslint_d" },
  java = { "checkstyle" },
}

-- Create an autocmd to lint on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
