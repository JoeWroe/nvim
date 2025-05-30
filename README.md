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
        ├── fzf.lua       -- FZF integration and shortcuts
        └── airline.lua   -- Statusline configuration using vim-airline
```

## 🔌 Plugins
Managed via `lazy.nvim`:
- LSP: `nvim-lspconfig`, `nvim-cmp`, `cmp-nvim-lsp`, `LuaSnip`
- UI: `noice.nvim`, `nvim-notify`, `vim-airline`
- Files: `nvim-tree.lua`, `fzf.vim`
- Editing: `vim-commentary`, `vim-surround`, `vim-smoothie`
- Syntax: `nvim-treesitter`, `treesitter-textobjects`
- Diagnostics: `trouble.nvim`

## 🗝 Key Features
- Semantic LSP navigation, rename, hover
- Fast fuzzy finders via FZF
- Syntax-aware code navigation and selection
- Pretty UI popups for messages and command input
- Smooth scrolling and visual polish

## 🚀 Getting Started
1. Clone the repo or copy the structure to your config folder (`~/.config/nvim/`)
2. Run `nvim` and `:Lazy sync`
3. Enjoy a modern Neovim experience!

---

Feel free to extend this setup or swap components like airline → lualine, fzf → telescope, etc.

Happy hacking! 😄
