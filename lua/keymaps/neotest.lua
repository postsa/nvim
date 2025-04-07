local wk = require "which-key"
wk.add {
  { "<leader>n", group = "neotest" },
  {
    "<leader>nt",
    function()
      require("neotest").run.run()
    end,
    desc = "neotest run test",
  },
  {
    "<leader>nd",
    function()
      require("neotest").run.run { strategy = "dap" }
    end,
    desc = "neotest debug test",
  },
  {
    "<leader>nf",
    function()
      require("neotest").run.run(vim.fn.expand "%")
    end,
    desc = "neotest run file",
  },
  {
    "<leader>no",
    function()
      require("neotest").output_panel.open()
    end,
    desc = "neotest show output",
  },
}
