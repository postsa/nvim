local wk = require "which-key"

wk.add {
  {
    "<leader>fr",
    function()
      require("telescope.builtin").lsp_references()
    end,
    desc = "telescope find references",
  },
  {
    "<leader>fi",
    function()
      require("telescope.builtin").lsp_implementations()
    end,
    desc = "telescope find implementations",
  },
  {
    "<leader>fd",
    function()
      require("telescope.builtin").lsp_definitions()
    end,
    desc = "telescope find definitions",
  },
  {
    "<leader>of",
    function()
      require("oil").open_float()
    end,
    desc = "oil open (float)",
  },
  {
    "<leader>oo",
    function()
      require("oil").open()
    end,
    desc = "oil open",
  },
  {
    "<leader>tf",
    function()
      require("nvchad.term").toggle {
        pos = "float",
        id = "fa",
        cmd = "lazygit",
        float_opts = { width = 0.8, height = 0.6, col = 0.1, row = 0.2, border = "double" },
      }
    end,
    desc = "New floating terminal",
    mode = "n",
  },
  {
    "<leader>gb",
    function()
      require("gitsigns").blame()
    end,
    desc = "git blame",
  },
  {
    "<leader>gc",
    function()
      require("gitsigns").blame_line()
    end,
    desc = "git blame current line",
  },
  {
    "<leader>gl",
    function()
      require("gitsigns").toggle_current_line_blame()
    end,
    desc = "toggle current line blame",
  },
  {
    "<leader>ef",
    function()
      vim.api.nvim_echo({ { vim.fn.expand "%:p", "hl-Normal" } }, false, {})
    end,
    desc = "echo absolute file path",
  },

  {
    "<leader>sd",
    function()
      require("telescope.builtin").diagnostics()
    end,
    desc = "telescope diagnostics",
  },
}
