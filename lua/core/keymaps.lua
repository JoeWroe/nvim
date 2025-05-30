-- lua/core/keymaps.lua

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Visual mode: search selection
map("v", "//", [[y/\V<C-R>=escape(@", '/\\')<CR><CR>]], opts)

-- Basic navigation and utility
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)
map("n", "<leader>wq", ":wq<CR>", opts)
map("n", "<esc>", ":noh<CR><esc>", opts)
map("n", "<leader>u", ":set cursorline!<CR>", opts)
map("n", "<<", ":update | bp<CR>", opts)
map("n", ">>", ":update | bn<CR>", opts)
map("n", "<leader>ls", ":update | ls<CR>", opts)

-- Smooth scrolling with vim-smoothie
map("n", "<leader>j", "<Plug>(SmoothieDownwards)", {})
map("n", "<leader>k", "<Plug>(SmoothieUpwards)", {})
map("n", "<leader>J", "<Plug>(SmoothieForwards)", {})
map("n", "<leader>K", "<Plug>(SmoothieBackwards)", {})

-- Insert mode shortcuts
map("i", "II", "<Esc>I", { noremap = true })
map("i", "AA", "<Esc>A", { noremap = true })
map("i", "OO", "<Esc>O", { noremap = true })

-- Nvim-tree
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>b", ":NvimTreeFindFile<CR>", opts)

-- FZF
map("n", "<leader>ff", ":update | FZF<CR>", opts)
map("n", "<leader>gf", ":update | GFiles?<CR>", opts)
map("n", "<leader>fh", ":History/<CR>", opts)

-- Trouble diagnostics (if using)
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)

