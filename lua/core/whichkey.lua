local wk = require("which-key")

wk.setup({})

wk.add({
  -- Top-level leader keys (descriptions only, keymaps defined elsewhere)
  { "<leader>w",   desc = "Write file" },
  { "<leader>q",   desc = "Quit" },
  { "<leader>wq",  desc = "Write & quit" },
  { "<leader>u",   desc = "Toggle cursorline" },
  { "<leader>j",   desc = "Scroll down half page" },
  { "<leader>k",   desc = "Scroll up half page" },
  { "<leader>J",   desc = "Scroll down full page" },
  { "<leader>K",   desc = "Scroll up full page" },
  { "<leader>ls",  desc = "List buffers" },

  -- Find
  { "<leader>f",   group = "Find" },
  { "<leader>ff",  "<cmd>Telescope find_files<cr>",  desc = "Find files" },
  { "<leader>fg",  "<cmd>Telescope live_grep<cr>",   desc = "Live grep" },
  { "<leader>fb",  "<cmd>Telescope buffers<cr>",     desc = "Buffers" },
  { "<leader>fh",  "<cmd>Telescope help_tags<cr>",   desc = "Help" },

  -- Overseer
  { "<leader>o",   group = "Overseer" },
  { "<leader>or",  "<cmd>OverseerRun<cr>",    desc = "Run task" },
  { "<leader>ot",  "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },

  -- Git
  { "<leader>g",   group = "Git" },
  { "<leader>gb",  "<cmd>lua require('gitsigns').blame_line()<cr>",   desc = "Blame line" },
  { "<leader>gp",  "<cmd>lua require('gitsigns').preview_hunk()<cr>", desc = "Preview hunk" },
  { "<leader>gr",  "<cmd>lua require('gitsigns').reset_hunk()<cr>",   desc = "Reset hunk" },
})
