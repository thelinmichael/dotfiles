-- Additions to LazyVim's default which-key config,
-- which in turn has been added on top of which-keys default config

return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = false },
      defaults = {
        ["<leader>h"] = { name = "+harpoon" },
        ["<leader>m"] = { name = "+markdown" },
        ["<leader>t"] = { name = "+testing" },
      },
    },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.register(opts.defaults)
    end,
  },
}
