return {
  -- Formatter
  {
    "stevearc/conform.nvim",
    -- event = "BufWritePre", -- uncomment for format on save
    opts = require("configs.conform"),
  },
  -- Copilot AI
--  {
 --   "github/copilot.vim",
  --  lazy = false,
 -- },
  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = { { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } },
  },
  -- Session Management
  {
    "rmagatti/auto-session",
    lazy = false,
    opts = { suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" } },
  },
  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig")
    end,
  },
  -- LSP Installer/Manager
  { "williamboman/mason.nvim", opts = {} },
  { "williamboman/mason-lspconfig.nvim", opts = {} },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- LSP servers
        "lua-language-server",
        "clangd",
        "rust-analyzer",
        "typescript-language-server",
        "eslint-lsp",
        "json-lsp",
        "yaml-language-server",
        "ansible-language-server",
        "terraform-ls",
        "tflint",
        "bash-language-server",
        "marksman",
        "prisma-language-server",
        "dockerfile-language-server",
        "taplo",
        "groovy-language-server",

        -- Formatters
        "stylua",
        "prettier",
        "clang-format",
        "rustfmt",
        "shfmt",

        -- Linters
        "actionlint",
        "ansible-lint",
        "yamllint",
        "markdownlint",
        "shellcheck",
        "eslint_d",
      },
      auto_update = false,
      run_on_start = true,
      start_delay = 3000,
      debounce_hours = 12,
    },
  },
  { "b0o/schemastore.nvim" },
  -- Hover Docs
  {
    "lewis6991/hover.nvim",
    config = function()
      require("hover").setup {
        
        init = function() require("hover.providers.lsp") end,
        preview_opts = { border = "single" },
        preview_window = false,
        title = true,
        mouse_providers = { "LSP" },
        mouse_delay = 1000,
      }
      vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
      vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })
      vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end, { desc = "hover.nvim (previous source)" })
      vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end, { desc = "hover.nvim (next source)" })
      vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
      vim.o.mousemoveevent = true
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("configs.lint")
    end,
  },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("configs.cmp")
    end,
  },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  -- Snippets
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  -- Autopairs
  { "windwp/nvim-autopairs", config = true },
  -- File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    config = true,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = { { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "File Explorer" } },
    opts = {
      view = {
        width = 25,
        side = "left",
        preserve_window_proportions = true,
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "󰈚",
            symlink = "",
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$", "node_modules", ".cache" },
      },
      git = {
        enable = true,
        ignore = true,
        timeout = 400,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = false,
          },
        },
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
    },
  },
  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        path_display = { "smart" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "jsonc",
        "tsx",
        "markdown",
        "markdown_inline",
        "c",
        "cpp",
        "rust",
        "python",
        "bash",
        "yaml",
        "toml",
        "cmake",
        "make",
        "dockerfile",
        "gitignore",
        "go",
        "sql",
        "java",
        "terraform",
        "hcl",
        "prisma",
        "groovy",
      },
    },
  },
  -- Git
  { "tpope/vim-fugitive" },
  -- Tabline with bufferline.nvim with buffer mode and tab mode 
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {
      options = {
        mode = "buffers", -- set to "tabs" to only show tabpages instead of buffers
        numbers = "ordinal",
        close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
        left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
        middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
        indicator = { style = "icon", icon = "▎" },
        buffer_close_icon = "",
        modified_icon = "●",
        close_icon = "",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = "nvim_lsp", -- or "nvim_lsp" | "coc"
        diagnostics_update_in_insert = false,
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
        separator_style = "slant", -- "slant" | "padded_slant" | "slope" | "padded_slope" | "thick" | "thin" | { "left", "right" }
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        sort_by = "id", -- 'insert_after_current' | 'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b) end
        diagnostics_indicator = function(_, _, diag)
          local s = ""
          for level, count in pairs(diag) do
            local icon = level:match "error" and " " or " "
            s = s .. icon .. count .. " "
          end
          return vim.trim(s)
        end,
      },
    },
  },
  -- Indent Guides

  -- Status Line with lualine.nvim
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = "iceberg_dark",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = {}, winbar = {} },
          always_divide_middle = true,
          always_show_tabline = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_c = { "filename" },
          lualine_x = { "location" },
        },
        winbar = {
          lualine_c = { "filename" },
          lualine_x = { "branch" },
        },
        inactive_winbar = {
          lualine_c = { "filename" },
        },
      }
    end,
  },
   -- Icons
  { "nvim-tree/nvim-web-devicons" },
  -- Colorscheme
  { "EdenEast/nightfox.nvim", config = function() vim.cmd.colorscheme("carbonfox") end },
  -- Commenting
  { "numToStr/Comment.nvim", config = true },
  -- Colorizer
  { "NvChad/nvim-colorizer.lua", config = true },
  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_open_to_the_world = 1
      vim.g.mkdp_browser = "brave"
    end,
  },
}
