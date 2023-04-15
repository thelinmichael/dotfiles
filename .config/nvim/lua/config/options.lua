-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- globals
vim.g.loaded_perl_provider = 0
vim.g.python3_host_prog = "/usr/bin/python3"

-- optionals
vim.opt.swapfile = false

-- A keymap for running tig in a popup
vim.keymap.set("n", "<leader>gt", function()
  local current_path = vim.fn.expand("%:p:h")
  local command = "a" -- go into terminal mode
    .. "cd "
    .. current_path
    .. "<CR>"
    .. "tig<CR>" -- run tig
  command = vim.api.nvim_replace_termcodes(command, true, false, true)

  require("detour").Detour() -- open a detour popup
  vim.cmd.terminal() -- open a terminal buffer
  vim.bo.bufhidden = "delete" -- close the terminal when window closes
  vim.api.nvim_feedkeys(command, "n", false)
end)
