-- lua/core/null-ls.lua

local null_ls = require("null-ls")

null_ls.setup({
  sources = {
    -- Formatters
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.stylua,

    -- Linters
    null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.diagnostics.shellcheck,

    -- Code actions (optional)
    null_ls.builtins.code_actions.gitsigns,
  },
})

