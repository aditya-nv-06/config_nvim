local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    markdown = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    prisma = { "prettier" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    rust = { "rustfmt" },
    -- conform.nvim built-in formatter key for `terraform fmt` is `terraform_fmt`.
    terraform = { "terraform_fmt" },
    tf = { "terraform_fmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
  },

  -- Use configured formatter; if unavailable, fallback to attached LSP formatter.
  format_on_save = {
    timeout_ms = 800,
    lsp_fallback = true,
  },
}

return options
