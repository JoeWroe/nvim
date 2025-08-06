# Neovim Config (Modular Lua Setup)

This Neovim configuration is structured in modular Lua files for better readability, maintainability, and scalability. It uses [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management and supports native LSP, autocompletion, Treesitter, and various UI enhancements.

## 📁 Directory Structure
```
.
├── init.lua              -- Main entry point
└── lua/
    └── core/
        ├── options.lua   -- Neovim options and settings
        ├── keymaps.lua   -- Key mappings
        ├── plugins.lua   -- Plugin declarations using lazy.nvim
        ├── lsp.lua       -- Native LSP and autocompletion setup
        ├── treesitter.lua-- Treesitter config for highlighting and textobjects
        ├── noice.lua     -- UI enhancements (noice.nvim)
        ├── nvimtree.lua  -- File explorer configuration
        ├── telescope.lua -- Telescope fuzzy finder configuration
        └── lualine.lua   -- Statusline configuration using lualine
```

## 🔌 Plugins
Managed via `lazy.nvim`:
- LSP: `nvim-lspconfig`, `nvim-cmp`, `cmp-nvim-lsp`, `LuaSnip`, `mason.nvim`
- UI: `noice.nvim`, `nvim-notify`, `lualine.nvim`, `which-key.nvim`
- Files: `nvim-tree.lua`, `telescope.nvim`
- Editing: `Comment.nvim`, `nvim-surround`, `vim-smoothie`, `nvim-autopairs`
- Syntax: `nvim-treesitter`
- Diagnostics: `trouble.nvim`, `none-ls.nvim`
- Git: `gitsigns.nvim`
- AI: `copilot.vim`, `ChatGPT.nvim`
- Testing: `neotest`
- Tasks: `overseer.nvim`

## 🗝 Key Features
- Semantic LSP navigation, rename, hover with Mason auto-installation
- Fast fuzzy finding via Telescope
- Syntax-aware code navigation and selection with Treesitter
- Pretty UI popups for messages and command input
- Smooth scrolling and visual polish
- Git integration with hunks, blame, and diff views
- AI assistance with GitHub Copilot and ChatGPT
- Comprehensive testing support with Neotest
- Task running with Overseer

## 🚀 Getting Started
1. Clone the repo or copy the structure to your config folder (`~/.config/nvim/`)
2. Run `nvim` and `:Lazy sync`
3. Enjoy a modern Neovim experience!

---

Feel free to extend this setup or swap components to match your preferences.

Happy hacking! 😄
