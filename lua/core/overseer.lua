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
        { "on_output_quickfix", open = true },
        { "on_complete_notify" },
        { "on_exit_set_status" },
      },
    }
  end,
  condition = {
    filetype = { "python", "javascript", "sh" },
  },
})

-- Register a template to test the current file
overseer.register_template({
  name = "Test current file",
  description = "Run tests for the current file",
  builder = function()
    local file = vim.fn.expand("%")
    local filename = vim.fn.expand("%:t")
    local filetype = vim.bo.filetype
    local cmd

    if filetype == "python" then
      -- For Python: pytest with verbose output and current file
      cmd = { "pytest", "-v", file }
    elseif filetype == "javascript" or filetype == "typescript" then
      -- Check for Playwright tests first (.spec.ts files with playwright import)
      if filename:match("%.spec%.ts$") then
        -- Read file content to check for playwright import
        local lines = vim.api.nvim_buf_get_lines(0, 0, 50, false) -- Check first 50 lines
        local has_playwright = false
        for _, line in ipairs(lines) do
          if line:match("from.*['\"]@playwright") or line:match("import.*playwright") or line:match("require.*playwright") then
            has_playwright = true
            break
          end
        end
        
        if has_playwright then
          cmd = { "npx", "playwright", "test", file }
        else
          cmd = { "npm", "test", file }
        end
      -- For other JS/TS test files
      elseif filename:match("%.test%.") or filename:match("%.spec%.") then
        cmd = { "npm", "test", file }
      else
        -- Try to find corresponding test file
        local test_patterns = {
          file:gsub("%.js$", ".test.js"),
          file:gsub("%.ts$", ".test.ts"),
          file:gsub("%.jsx$", ".test.jsx"),
          file:gsub("%.tsx$", ".test.tsx"),
        }
        for _, test_file in ipairs(test_patterns) do
          if vim.fn.filereadable(test_file) == 1 then
            cmd = { "npm", "test", test_file }
            break
          end
        end
        if not cmd then
          vim.notify("No test file found for " .. filename, vim.log.levels.WARN)
          return
        end
      end
    elseif filetype == "go" then
      cmd = { "go", "test", "-v", file }
    else
      vim.notify("Unsupported filetype for testing: " .. filetype, vim.log.levels.WARN)
      return
    end

    return {
      cmd = cmd,
      name = "Test " .. filename,
      components = {
        { "display_duration" },
        { "on_output_quickfix", open = true },
        { "on_complete_notify" },
        { "on_exit_set_status" },
      },
    }
  end,
  condition = {
    filetype = { "python", "javascript", "typescript", "go" },
  },
})

-- Keybindings
vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<cr>", { desc = "Overseer: Run task" })
vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<cr>", { desc = "Overseer: Toggle UI" })

-- Direct keymap to run tests for current file
vim.keymap.set("n", "<leader>tf", function()
  local overseer = require("overseer")
  overseer.run_template({ name = "Test current file" })
end, { desc = "Test current file" })
