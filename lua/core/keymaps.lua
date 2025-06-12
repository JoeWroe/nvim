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
map("n", "<leader>ul", ":set cursorline!<CR>", opts)
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

-- Telescope
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>gf", "<cmd>Telescope git_files<cr>", opts)
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope oldfiles<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts)

-- Trouble diagnostics (if using)
vim.keymap.set("n", "<leader>tt", "<cmd>Trouble<cr>", opts)
vim.keymap.set("n", "<leader>twd", "<cmd>Trouble workspace_diagnostics<cr>", opts)
vim.keymap.set("n", "<leader>tdd", "<cmd>Trouble document_diagnostics<cr>", opts)

-- Git signs
vim.keymap.set("n", "]c", function()
  if vim.wo.diff then return "]c" end
  vim.schedule(function() require("gitsigns").next_hunk() end)
  return "<Ignore>"
end, { expr = true, desc = "Next Git hunk" })

vim.keymap.set("n", "[c", function()
  if vim.wo.diff then return "[c" end
  vim.schedule(function() require("gitsigns").prev_hunk() end)
  return "<Ignore>"
end, { expr = true, desc = "Prev Git hunk" })

vim.keymap.set("n", "<leader>gb", function() require("gitsigns").blame_line() end, { desc = "Git blame line" })
vim.keymap.set("n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
vim.keymap.set("n", "<leader>gr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" })

-- Copilot
vim.keymap.set("i", "<C-L>", "<Plug>(copilot-accept-word)", { silent = true, desc = "Accept next word of suggestion" })
vim.keymap.set("i", "<C-K>", "<Plug>(copilot-accept-line)", { silent = true, desc = "Accept next line of suggestion" })
vim.keymap.set("i", "<C-Right>", "<Plug>(copilot-next)", { silent = true, desc = "Copilot next suggestion" })
vim.keymap.set("i", "<C-Left>", "<Plug>(copilot-previous)", { silent = true, desc = "Copilot previous suggestion" })

-- ChatGPT
vim.keymap.set("n", "<leader>cg", ":ChatGPT<CR>", { desc = "ChatGPT" })
