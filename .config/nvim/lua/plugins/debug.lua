-- Everything debugging
-- Limited to Go support
-- Update using Mason

return {
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "leoluz/nvim-dap-go",
    },
    keys = {
      {
        "<leader>dd",
        function()
          require("dap").continue()
        end,
        desc = "Debug this shit (or continue)",
      },
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
