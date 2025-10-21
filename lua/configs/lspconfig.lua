-- Load NvChad's default LSP config (keymaps, capabilities, etc.)
require("nvchad.configs.lspconfig").defaults()

-- Enhanced setup for JavaScript and TypeScript (tsserver)
local lspconfig = require("lspconfig")

-- Optional: disable formatting if you use Prettier/conform
local on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = function(client)
    client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
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
    })
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" },
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  on_init = function(client)
    client.config.settings = vim.tbl_deep_extend("force", client.config.settings, {
      clangdFileStatus = {
        semanticHighlighting = true,
      },
    })
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end,
}

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize the `vim` global
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true), -- Make the server aware of Neovim runtime files
        checkThirdParty = false, -- Disable prompt for third-party libraries
      },
      telemetry = {
        enable = false, -- Disable telemetry
      },
    },
  },
}

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        enable = true,
        command = "clippy",
      },
      procMacro = {
        enable = true,
      },
      inlayHints = {
        lifetimeElisionHints = {
          enable = true,
          useParameterNames = true,
        },
        bindingModeHints = {
          enable = true,
        },
        closureReturnTypeHints = {
          enable = "always",
        },
        expressionAdjustmentHints = {
          enable = "always",
        },
        typeHints = {
          enable = true,
          hideClosureInitialization = false,
          hideNamedConstructor = false,
        },
      },
    },
  },
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic", -- Options: off, basic, strict
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
      },
    },
  },
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  settings = {
    css = {
      validate = true,
    },
    scss = {
      validate = true,
    },
    less = {
      validate = true,
    },
  },

}





-- List all other web development LSP servers you want to enable
local servers = {
  "html",           -- HTML
  "cssls",          -- CSS
  "jsonls",         -- JSON
  "tailwindcss",    -- Tailwind CSS
  "emmet_ls",       -- Emmet
  "graphql",        -- GraphQL
  "yamlls",         -- YAML
  "prismals",       -- Prisma
  "dockerls",       -- Docker
  "marksman",       -- Markdown
  "bashls",         -- bashls
  "gopls",          -- Go
  "sqlls",          -- SQL
  "vimls",          -- Vim script 
}

-- Enable all listed servers (NvChad helper)
vim.lsp.enable(servers)

