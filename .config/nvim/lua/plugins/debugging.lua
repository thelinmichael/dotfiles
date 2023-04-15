return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
    },
    config = function()
      local dapui = require("dapui")
      dapui.setup()

      -- dap fires events, we can listen on them to open UI on certain events
      local dap = require("dap")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- nvim-dap keymappings
      map = vim.keymap.set
      -- Press f5 to debug
      map("n", "<leader>dd", [[:lua require'dap'.continue()<CR>]], { desc = "Debug menu/Continue" })
      -- Press CTRL + b to toggle regular breakpoint
      map("n", "<leader>db", [[:lua require'dap'.toggle_breakpoint()<CR>]], { desc = "Toggle breakpoint" })
      -- Press CTRL + c to toggle Breakpoint with Condition
      map(
        "n",
        "<leader>dc",
        [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]],
        { desc = "Breakpoint condition" }
      )
      -- Press CTRL + l to toggle Logpoint
      map(
        "n",
        "<leader>dp",
        [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]],
        { desc = "Breakpoint log" }
      )
      -- Pressing F10 to step over
      map("n", "<leader>dso", [[:lua require'dap'.step_over()<CR>]], { desc = "Step over " })
      -- Pressing F11 to step into
      map("n", "<leader>dsi", [[:lua require'dap'.step_into()<CR>]], { desc = "Step into" })
      -- Pressing F12 to step out
      map("n", "<leader>dsx", [[:lua require'dap'.step_out()<CR>]], { desc = "Step out" })
      -- Press F6 to open REPL
      map("n", "<leader>dor", [[:lua require'dap'.repl.open()<CR>]], { desc = "Open REPL" })
      -- Press dl to run last ran configuration (if you used f5 before it will re run it etc)
      map("n", "<leader>dl", [[:lua require'dap'.run_last()<CR>]], { desc = "Debug last" })

      -- Press Ctrl+d to toggle debug mode
      -- TODO: Remove NeoTree
      map("n", "<leader>dt", [[:lua require'dapui'.toggle()<CR>]], { desc = "Toggle debug" })
      require("dap-go").setup({
        dap_configurations = {
          {
            type = "go",
            request = "launch",
            name = "ignore vendor",
          },
          {
            type = "go",
            name = "Attach remote",
            mode = "remote",
            request = "attach",
          },
        },
        -- delve configurations
        delve = {
          -- time to wait for delve to initialize the debug session.
          -- default to 20 seconds
          initialize_timeout_sec = 20,
          -- a string that defines the port to start delve debugger.
          -- default to string "${port}" which instructs nvim-dap
          -- to start the process in a random available port
          port = "${port}",
        },
      })
    end,
  },
}
