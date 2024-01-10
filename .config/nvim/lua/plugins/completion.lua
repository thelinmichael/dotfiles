-- Code completion

return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.completion = {
        completeopt = "menu,noselect",
      }
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      })
    end,
  },
}
