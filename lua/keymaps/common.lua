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
}
