require("nvchad.configs.lspconfig").defaults()

local lsp_config_api = vim.lsp and vim.lsp.config
local lsp_enable_api = vim.lsp and vim.lsp.enable
local lsp_config_callable = (vim.is_callable and vim.is_callable(lsp_config_api)) or type(lsp_config_api) == "function"
local lsp_config_is_table = type(lsp_config_api) == "table"
local has_native_lsp_api = type(lsp_enable_api) == "function"
  and (lsp_config_callable or lsp_config_is_table)

if not has_native_lsp_api then
  vim.notify("LSP setup failed: Neovim 0.11+ native LSP API is required", vim.log.levels.ERROR)
  return
end

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

local on_attach = function(client, _)
  if disable_formatting_servers[client.name] then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
end

local function setup(server, opts)
  local config = vim.tbl_deep_extend("force", {
    capabilities = capabilities,
    on_attach = on_attach,
  }, opts or {})

  if lsp_config_is_table and not lsp_config_callable then
    lsp_config_api[server] = vim.tbl_deep_extend("force", lsp_config_api[server] or {}, config)
  else
    lsp_config_api(server, config)
  end

  lsp_enable_api(server)
end

-- Core languages
setup("clangd")
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
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
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

-- Infra and config languages
setup("terraformls")
setup("tflint")
setup("ansiblels")
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
      schemas = has_schemastore and schemastore.yaml.schemas({
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
      }) or nil,
    },
  },
})

-- Docs and others
setup("marksman")
setup("prismals")
setup("bashls")
setup("dockerls")
setup("taplo")
setup("groovyls", { filetypes = { "groovy" } })
setup("html")
setup("cssls")
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
