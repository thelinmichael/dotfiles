return {
  {
    "rasulomaroff/reactive.nvim",
    enabled = true,
    config = function()
      require("reactive").setup({
        builtin = {
          cursor = true,
        },
      })
    end,
  },
}
