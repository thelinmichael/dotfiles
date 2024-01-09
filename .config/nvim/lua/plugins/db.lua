local Util = require("lazyvim.util")

return {
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = false,
    dependencies = {
      { "tpope/vim-dadbod", lazy = true },
      { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
    },
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    -- mysql://user:password@localhost:3306
    "jorgerojas26/lazysql",
    config = function()
      vim.keymap.set("n", "<leader>sq", function()
        Util.terminal.open({ "lazysql" }, {
          cwd = Util.root.get(),
          ctrl_hjkl = false,
          border = "rounded",
          persistent = false,
          title = "Lazysql",
          title_pos = "center",
        })
      end, { desc = "Lazysql" })
    end,
  },
}
