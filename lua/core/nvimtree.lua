-- lua/core/nvimtree.lua

require("nvim-tree").setup({})

-- Key mappings (already included in keymaps.lua, but included here for clarity)
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>b", ":NvimTreeFindFile<CR>", opts)

