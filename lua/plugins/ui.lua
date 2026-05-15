return {
  {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },

  opts = {
    cmdline = {
      enabled = true,
      view = "cmdline_popup",
    },

    messages = {
      enabled = true,
    },

    popupmenu = {
      enabled = true,
      backend = "nui",
    },

    notify = {
      enabled = true,
    },

    lsp = {
      progress = {
        enabled = true,
      },
      hover = {
        enabled = true,
      },
      signature = {
        enabled = true,
      },
    },

    presets = {
      command_palette = true,
      long_message_to_split = true,
    },
  },

  config = function(_, opts)
    require("notify").setup({})
    vim.notify = require("notify")

    require("noice").setup(opts)
  end,
}, {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {},
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
      { "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
      { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
      { "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "LSP Definitions / references / ... (Trouble)" },
      { "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
      { "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "iceberg_dark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          globalstatus = true,
        },
      })
    end,
  },
  { "nvim-tree/nvim-web-devicons" },
  { "EdenEast/nightfox.nvim", config = function() vim.cmd.colorscheme("carbonfox") end },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" } },
    opts = {
      view = { width = 20, side = "right", preserve_window_proportions = true },
    },
  },
}
