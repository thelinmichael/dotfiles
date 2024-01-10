-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Tabs (Sweden style)
map("n", "ö", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "ä", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Resolving key shortcut conflict involving mini.comment
vim.keymap.del("n", "gc")
vim.keymap.del("n", "gcc")
