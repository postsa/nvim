local mason_dap = require "mason-nvim-dap"
local dap = require "dap"
local ui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

-- Dap Virtual Text
dap_virtual_text.setup()
mason_dap.setup {
  ensure_installed = { "delve", "debugpy" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
    python = function(config)
      config.adapters = {
        type = "executable",
        command = "python",
        args = {
          "-m",
          "debugpy.adapter",
        },
      }
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

dap.configurations.python = {
  {
    type = "python",
    name = "Debug (attach)",
    request = "attach",
    connect = {
      host = "localhost",
      port = 5678,
    },
  },
  {
    type = "python",
    name = "Debug",
    request = "launch",
    program = "${file}",
    justMyCode = false,
  },
}

dap.configurations.go = {
  {
    type = "delve",
    name = "Debug (attach)",
    request = "attach",
    processId = require("dap.utils").pick_process,
  },
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test",
    request = "launch",
    mode = "test",
    program = "${file}",
  },
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}",
  },
}

-- Dap UI
ui.setup {
  controls = {
    element = "repl",
    enabled = true,
    icons = {
      disconnect = "",
      pause = "",
      play = "",
      run_last = "",
      step_back = "",
      step_into = "",
      step_out = "",
      step_over = "",
      terminate = "",
    },
  },
  element_mappings = {},
  expand_lines = true,
  floating = {
    border = "single",
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  force_buffers = true,
  icons = {
    collapsed = "󰡏",
    current_frame = "",
    expanded = "󰡍",
  },
  layouts = {
    {
      elements = {
        {
          id = "repl",
          size = 1.0,
        },
      },
      position = "bottom",
      size = 15,
    },
    {
      elements = {
        {
          id = "stacks",
          size = 0.4,
        },
        {
          id = "scopes",
          size = 0.6,
        },
      },
      position = "left",
      size = 60,
    },
  },
  mappings = {
    edit = "e",
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t",
  },
  render = {
    indent = 1,
    max_value_lines = 100,
  },
}

vim.fn.sign_define("DapBreakpoint", { text = "" })
dap.listeners.before.attach.dapui_config = function()
  ui.open()
end
dap.listeners.before.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
