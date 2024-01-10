-- Reading markdown

return {
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({
        style = "dark",
        width = 120,
      })
    end,
    keys = {
      {
        "<leader>md",
        ":Glow<CR>",
        desc = "View markdown",
      },
    },
  },
}
