-- lua/core/plugins.lua

-- Bootstrap lazy.nvim if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Now safe to call require("lazy")
require("lazy").setup({

  -- Theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
  },

  -- LSP formatting, linters, diagnostics
  {
    "nvimtools/none-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPre",
    build = ":TSUpdate",
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,  -- Eager-load to ensure keymaps in keymaps.lua work
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Smooth scrolling
  {
    "psliwka/vim-smoothie",
    event = "VeryLazy",
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = true,
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = true,
  },

  -- Commenting
  {
    "numToStr/Comment.nvim",
    keys = { "gc", "gcc", "gbc" },
    config = true,
  },

  -- Auto pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- UI enhancements
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },

  -- Trouble (Diagnostics list)
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  -- Overseer (Task runner)
  {
    "stevearc/overseer.nvim",
    cmd = { "OverseerRun", "OverseerToggle" },
    keys = {
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run task" },
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle task list" },
    },
    config = true,
  },
})
