-- lua/core/overseer.lua

local overseer = require("overseer")

-- Set up overseer with default config
overseer.setup({})

-- Register a template to run the current file
overseer.register_template({
  name = "Run current file",
  builder = function()
    local file = vim.fn.expand("%")
    local cmd
    local filetype = vim.bo.filetype

    if filetype == "python" then
      cmd = { "python3", file }
    elseif filetype == "javascript" then
      cmd = { "node", file }
    elseif filetype == "sh" then
      cmd = { "bash", file }
    else
      vim.notify("Unsupported filetype: " .. filetype, vim.log.levels.WARN)
      return
    end

    return {
      cmd = cmd,
      name = "Run " .. file,
      components = {
        { "display_duration" },
        { "on_output_quickfix", open = true }, -- open the output automatically
        { "on_complete_notify" },
        { "on_exit_set_status" },
      },
    }
  end,
  condition = {
    filetype = { "python", "javascript", "sh" },
  },

  name = "Test current file",
  description = "Test the current file",
  builder = function()
    local file = vim.fn.expand("%")
    local cmd
    local filetype = vim.bo.filetype

    if filetype == "python" then
      cmd = { "pytest", file }
    else
      vim.notify("Unsupported filetype for testing: " .. filetype, vim.log.levels.WARN)
      return
    end

    return {
      cmd = cmd,
      name = "Test " .. file,
      components = {
        { "display_duration" },
        { "on_output_quickfix", open = true }, -- open the output automatically
        { "on_complete_notify" },
        { "on_exit_set_status" },
      },
    }
})

-- Keybindings
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { desc = "Overseer: Run task" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { desc = "Overseer: Toggle UI" })
