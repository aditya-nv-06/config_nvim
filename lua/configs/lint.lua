local lint = require "lint"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  markdown = { "markdownlint" },
  terraform = { "tflint" },
  tf = { "tflint" },
  yaml = { "yamllint" },
  ansible = { "ansible_lint" },
  sh = { "shellcheck" },
  bash = { "shellcheck" },
  zsh = { "shellcheck" },
}

local group = vim.api.nvim_create_augroup("nvim_lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = group,
  callback = function()
    lint.try_lint()

    local filename = vim.api.nvim_buf_get_name(0)
    if filename:match("/%.github/workflows/.*%.ya?ml$") then
      lint.try_lint "actionlint"
    end
  end,
})
