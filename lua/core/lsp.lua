-- lua/core/lsp.lua

local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

local capabilities = cmp_nvim_lsp.default_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

local on_attach = function(client, bufnr)
  local map = vim.api.nvim_buf_set_keymap
  local opts = { noremap = true, silent = true }

  -- Attach nvim-navic if server supports document symbols
  if client.server_capabilities.documentSymbolProvider then
    require("nvim-navic").attach(client, bufnr)
  end

  map(bufnr, "n", "<leader>gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
  map(bufnr, "n", "<leader>gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
  map(bufnr, "n", "<leader>gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)

  map(bufnr, "n", "<leader>rk", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map(bufnr, "n", "<leader>rrn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map(bufnr, "n", "<leader>rfc", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
  map(bufnr, "n", "<leader>rxx", "<cmd>TroubleToggle<CR>", opts)
end


-- nvim-cmp setup
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
  }),
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },
})

-- Enable autopairs on cmp confirm
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",       -- Lua
    "pyright",      -- Python
    "groovyls",     -- Groovy
    "ts_ls",        -- TypeScript
    "html",         -- HTML
    "cssls",        -- CSS
    "jsonls",       -- JSON
  },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
  },
})


require("mason-null-ls").setup({
  ensure_installed = {
    "prettier",
    "stylua",
    "eslint_d",
    "eslint_lsp",
    "black",
    "npm-groovy-lint",
    "typescript-language-server",
    -- Add more as needed
  },
  automatic_installation = true,
})

