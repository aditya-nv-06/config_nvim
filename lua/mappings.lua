 require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set
local has_telescope, telescope = pcall(require, "telescope.builtin")

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Telescope
if has_telescope then
  map("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
  map("n", "<leader>fa", function()
    telescope.find_files { hidden = true, no_ignore = true }
  end, { desc = "Telescope find all files" })
  map("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
  map("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
  map("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
  map("n", "<leader>fo", telescope.oldfiles, { desc = "Telescope recent files" })
  map("n", "<leader>fc", telescope.grep_string, { desc = "Telescope grep word under cursor" })
end

-- Buffers
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
