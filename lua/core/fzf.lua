-- lua/core/fzf.lua

-- FZF key mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map("n", "<leader>ff", ":update | FZF<CR>", opts)
map("n", "<leader>gf", ":update | GFiles?<CR>", opts)
map("n", "<leader>fh", ":History/<CR>", opts)

