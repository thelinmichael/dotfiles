return {
  {
    "carbon-steel/detour.nvim",
    config = function()
      vim.keymap.set("n", "<leader>fl", ":Detour<cr>")
    end,
  },
}
