-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "nord",
  -- hl_override = {
  --  Comment = { italic = true },
  --  ["@comment"] = { italic = true },
  -- },
}

M.options = {
  -- Any other options you want to set
}

M.mappings = {
  -- Any custom key mappings
}

M.plugins = {
  -- Any custom plugins
}

-- Setting options through vim.opt
vim.opt.conceallevel = 2

-- Alternatively, setting conceallevel using autocommand
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set conceallevel=2",
})

return M