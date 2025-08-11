-- lua/core/telescope.lua

local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    prompt_prefix = "🔍 ",
    selection_caret = "➤ ",
    path_display = { "smart" },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    ['lsp_definitions'] = {
      show_line = true,
      show_filename = true,
    },
    ['lsp_references'] = {
      show_line = true,
      show_filename = true,
    },
    ['lsp_implementations'] = {
      show_line = true,
      show_filename = true,
    },
  },
})

-- Load the fzf extension
pcall(telescope.load_extension, "fzf")
