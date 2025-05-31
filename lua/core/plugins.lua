-- lua/core/plugins.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "hashivim/vim-terraform" },
  { "godlygeek/tabular" },
  { "mileszs/ack.vim" },
  { "ryanoasis/vim-devicons" },
  { "preservim/vim-markdown" },
  { "psliwka/vim-smoothie" },
  { "tpope/vim-commentary" },
  { "tpope/vim-surround" },
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/noice.nvim", dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" } },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-treesitter/nvim-treesitter-textobjects" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "L3MON4D3/LuaSnip" },
  { "saadparwaiz1/cmp_luasnip" },
  { "folke/trouble.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "folke/tokyonight.nvim", priority = 1000 },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8", dependencies = {
        "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  { "windwp/nvim-autopairs", event = "InsertEnter", config = true },
})

