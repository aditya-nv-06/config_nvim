return {
  { "stevearc/conform.nvim", opts = require("configs.conform") },
  { "rmagatti/auto-session", lazy = false, opts = { suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" } } },
  { "nvim-treesitter/nvim-treesitter", opts = require("configs.treesitter") },
  { "tpope/vim-fugitive" },
  { "numToStr/Comment.nvim", config = true },
  { "NvChad/nvim-colorizer.lua", config = true },
  { "windwp/nvim-autopairs", config = true },
}
