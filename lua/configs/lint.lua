local lint = require "lint"
-- Allow both ansible_lint and ansible-lint linter name styles.
lint.linters["ansible-lint"] = lint.linters.ansible_lint
local github_workflow_pattern = "[/\\]%.github[/\\]workflows[/\\].*%.ya?ml$"

lint.linters_by_ft = {
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  markdown = { "markdownlint" },
  terraform = { "tflint" },
  tf = { "tflint" },
  yaml = { "yamllint" },
  ansible = { "ansible-lint" },
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
    if filename:match(github_workflow_pattern) then
      lint.try_lint "actionlint"
    end
  end,
})
