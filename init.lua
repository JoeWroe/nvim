-- init.lua
-- Entry point: set up leader and load modules

vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

require("core.options")
require("core.keymaps")
require("core.plugins")
require("core.colorscheme")
require("core.lsp")
require("core.null-ls")
require("core.telescope")
require("core.treesitter")
require("core.noice")
require("core.nvimtree")
require("core.lualine")

