-- lua/core/nvimtree.lua

require("nvim-tree").setup({
  disable_netrw = true,
  filters = {
    dotfiles = false,
    git_clean = false,
  },

  git_clean = {
    enable = true,
    ignore = false,
  }
})

-- Key mappings (already included in keymaps.lua, but included here for clarity)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>b", ":NvimTreeFindFile<CR>", opts)

