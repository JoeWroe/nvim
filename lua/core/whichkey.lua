local wk = require("which-key")

wk.setup({})

wk.register({
  w = { "Write file" },
  q = { "Quit" },
  wq = { "Write & quit" },
  u = { "Toggle cursorline" },
  j = { "Smooth scroll down" },
  k = { "Smooth scroll up" },
  J = { "Smooth scroll forward" },
  K = { "Smooth scroll backward" },
  ls = { "List buffers" },

  f = {
    name = "Find",
    f = { "<cmd>Telescope find_files<cr>", "Find files" },
    g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
  },

  o = {
    name = "Overseer",
    r = { "<cmd>OverseerRun<cr>", "Run task" },
    t = { "<cmd>OverseerToggle<cr>", "Toggle task list" },
  },

  g = {
    name = "Git",
    -- Add your git mappings here
  },
}, { prefix = "<leader>" })
