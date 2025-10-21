-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gatekeeper",
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  nvdash = {
    load_on_startup = true,
    header = {
      "  _   _       _   _           _     ",
      " | \\ | |     | | (_)         | |    ",
      " |  \\| |_   _| |_ _  ___  ___| |__  ",
      " | . ` | | | | __| |/ _ \\/ __| '_ \\ ",
      " | |\\  | |_| | |_| |  __/ (__| | | |",
      " |_| \\_|\\__,_|\\__|_|\\___|\\___|_| |_|",
    },
    buttons = {
      { "e", "New file", "<cmd>ene!<CR>" },
      { "f", "Find file", "<cmd>Telescope find_files<CR>" },
      { "r", "Recent files", "<cmd>Telescope oldfiles<CR>" },
      { "s", "Settings", "<cmd>e ~/.config/nvim/lua/custom/chadrc.lua<CR>" },
    },
  },
}

return M
