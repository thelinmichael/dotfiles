local setup = function()
  local nt = require("neotest")
  nt.setup({
    adapters = {
      require("neotest-go")({
        experimental = {
          test_table = true,
        },
        args = { "-v -count=1", "-timeout=60s" },
      }),
      require("neotest-plenary"),
    },
    diagnostic = {
      enabled = true,
    },
    running = {
      concurrent = false,
    },
    status = {
      enabled = true,
      virtual_text = false,
      signs = true,
    },
    strategies = {
      integrated = {
        width = 180,
      },
    },
  })
end

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-go",
      "nvim-neotest/neotest-plenary",
    },
    cmd = "Neotest",
    config = setup,
    keys = {
      -- call test for function in cursor
      {
        "<leader>tn",
        function()
          require("neotest").run.run()
        end,
        desc = "Run nearest test",
      },
      -- call test for current file
      {
        "<leader>tt",
        function()
          require("neotest").run.run(vim.fn.expand("%"))
        end,
        desc = "Run all tests in file",
      },
      -- call test all files
      {
        "<leader>tp",
        function()
          require("neotest").run.run(vim.fn.getcwd())
        end,
        desc = "Run all in suite (cwd)",
      },
      -- open/close test summary
      {
        "<leader>ts",
        function()
          require("neotest").summary.toggle()
        end,
        desc = "Toggle test summary",
      },
      -- open output panel
      {
        "<leader>to",
        function()
          require("neotest").output_panel.toggle()
        end,
        desc = "Toggle test panel",
      },
      -- jump prev failed test
      {
        "<leader>[t",
        function()
          require("neotest").jump.prev({ status = "failed" })
        end,
        desc = "Jump to previous failed test",
      },
      -- jump next failed test
      {
        "<leader>]t",
        function()
          require("neotest").jump.next({ status = "failed" })
        end,
        desc = "Jump to next failed test",
      },
      -- rerun test(s)
      {
        "<leader>tr",
        function()
          require("neotest").run.run_last()
        end,
        desc = "Rerun test(s)",
      },
    },
  },
}
