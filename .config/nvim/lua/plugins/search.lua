return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "ThePrimeagen/harpoon",
      config = function()
        require("telescope").load_extension("harpoon")
      end,
    },
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
      {
        "<leader>fh",
        "<cmd>:Telescope harpoon marks<cr>",
        desc = "Telescope Harpoon marks",
      },
    },
    -- change some options
    opts = {
      defaults = {
        file_ignore_patterns = { "out/" },
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        path_display = {
          truncate = 3,
        },
        winblend = 0,
      },
    },
  },
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>hh",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Toggle harpoon menu",
      },
      {
        "<leader>ha",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add harpoon",
      },
      {
        "<leader>hö",
        function()
          require("harpoon.ui").nav_prev()
        end,
        desc = "Previous harpoon",
      },
      {
        "<leader>hä",
        function()
          require("harpoon.ui").nav_next()
        end,
        desc = "Next harpoon",
      },
    },
    opts = function(_, opts)
      save_on_toggle = true
    end,
  },
}
