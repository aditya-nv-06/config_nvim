 require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })
map("n", "<leader>fa", "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", { desc = "Telescope find all files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope buffers" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope help tags" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { desc = "Telescope recent files" })
map("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Telescope grep word under cursor" })

-- Buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
