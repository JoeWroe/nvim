-- lua/core/noice.lua

require("noice").setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- Command-line search at the bottom
    command_palette = true,       -- Command line and popup together
    long_message_to_split = true, -- Long messages go to a split
  },
})

