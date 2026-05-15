require("nvchad.configs.lspconfig").defaults()

local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.lsp.protocol.make_client_capabilities()

if has_cmp then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local has_schemastore, schemastore = pcall(require, "schemastore")

local disable_formatting_servers = {
  ts_ls = true,
  jsonls = true,
  yamlls = true,
  html = true,
  cssls = true,
}

-- on_attach factory (new API friendly)
local function on_attach(server_name)
  return function(client)
    if disable_formatting_servers[server_name] then
      client.server_capabilities.documentFormattingProvider = false
      client.server_capabilities.documentRangeFormattingProvider = false
    end
  end
end

-- modern setup helper (replaces lspconfig.setup)
local function setup(server, opts)
  opts = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach(server),
  }, opts or {})

  vim.lsp.config(server, opts)
  vim.lsp.enable(server)
end

-- =========================
-- Core languages
-- =========================

setup "clangd"

setup("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
      procMacro = { enable = true },
    },
  },
})

setup("ts_ls", {
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
})

setup "eslint"

-- =========================
-- Infra / config languages
-- =========================

setup "terraformls"
setup "tflint"
setup "ansiblels"

setup("jsonls", {
  settings = {
    json = {
      validate = { enable = true },
      schemas = has_schemastore and schemastore.json.schemas() or nil,
    },
  },
})

setup("yamlls", {
  settings = {
    yaml = {
      validate = true,
      keyOrdering = false,
      schemaStore = { enable = false, url = "" },
      schemas = has_schemastore and schemastore.yaml.schemas {
        extra = {
          {
            description = "GitHub Workflow",
            fileMatch = { ".github/workflows/*.{yml,yaml}" },
            name = "github-workflow",
            url = "https://json.schemastore.org/github-workflow.json",
          },
          {
            description = "GitHub Action",
            fileMatch = { "action.{yml,yaml}" },
            name = "github-action",
            url = "https://json.schemastore.org/github-action.json",
          },
        },
      } or nil,
    },
  },
})

-- =========================
-- Docs / misc
-- =========================

setup "marksman"
setup "prismals"
setup "bashls"
setup "dockerls"
setup "taplo"
setup("groovyls", { filetypes = { "groovy" } })
setup "html"
setup "cssls"

setup("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})
