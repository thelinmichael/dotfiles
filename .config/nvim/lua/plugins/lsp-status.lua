return {
  {
    "j-hui/fidget.nvim",
    config = function(opts)
      opts.tag = "legacy"
      require("fidget").setup({})
    end,
  },
}
