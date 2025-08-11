-- lua/core/claude.lua

local M = {}

local function create_floating_window()
  -- Get or create Claude Chat buffer
  local claude_bufnr = vim.fn.bufnr('Claude Chat')
  
  if claude_bufnr == -1 or not vim.fn.bufloaded(claude_bufnr) then
    -- Create new buffer
    claude_bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_name(claude_bufnr, 'Claude Chat')
    
    -- Set buffer options
    vim.api.nvim_buf_set_option(claude_bufnr, 'buftype', 'nofile')
    vim.api.nvim_buf_set_option(claude_bufnr, 'bufhidden', 'hide')
    vim.api.nvim_buf_set_option(claude_bufnr, 'swapfile', false)
    vim.api.nvim_buf_set_option(claude_bufnr, 'linebreak', true)
    vim.api.nvim_buf_set_option(claude_bufnr, 'foldmethod', 'expr')
    vim.api.nvim_buf_set_option(claude_bufnr, 'foldexpr', 'GetChatFold(v:lnum)')
    vim.api.nvim_buf_set_option(claude_bufnr, 'foldlevel', 1)
    vim.api.nvim_buf_set_option(claude_bufnr, 'filetype', 'claudechat')
    
    -- Setup initial content
    local system_prompt = vim.g.claude_default_system_prompt or {'You are a helpful assistant.'}
    local initial_lines = {'System prompt: ' .. system_prompt[1]}
    
    -- Add remaining system prompt lines with tab indentation
    for i = 2, #system_prompt do
      table.insert(initial_lines, '\t' .. system_prompt[i])
    end
    
    -- Add instruction lines
    table.insert(initial_lines, 'Type your messages below, press C-] to send.  (Content of all buffers is shared alongside!)')
    table.insert(initial_lines, '')
    table.insert(initial_lines, 'You: ')
    
    vim.api.nvim_buf_set_lines(claude_bufnr, 0, -1, false, initial_lines)
    
    -- Setup buffer keymaps
    local opts = { buffer = claude_bufnr, silent = true }
    vim.keymap.set('i', '<C-]>', '<Esc>:call s:SendChatMessage("Claude:")<CR>', opts)
    vim.keymap.set('n', '<C-]>', ':call s:SendChatMessage("Claude:")<CR>', opts)
    vim.keymap.set('n', '<Esc>', '<cmd>close<CR>', opts)
    vim.keymap.set('n', 'q', '<cmd>close<CR>', opts)
    
    -- Setup autocmd to go to end when entering buffer
    vim.api.nvim_create_autocmd('BufWinEnter', {
      buffer = claude_bufnr,
      callback = function()
        vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(claude_bufnr), 0})
      end,
      group = vim.api.nvim_create_augroup('ClaudeChatFloat', { clear = true })
    })
  end

  -- Calculate floating window dimensions (80% of screen)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Window configuration
  local win_opts = {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
    title = ' Claude Chat ',
    title_pos = 'center'
  }

  -- Check if buffer is already in a window
  local existing_winid = vim.fn.bufwinid(claude_bufnr)
  if existing_winid ~= -1 then
    -- Focus existing window
    vim.api.nvim_set_current_win(existing_winid)
  else
    -- Create new floating window
    local claude_winid = vim.api.nvim_open_win(claude_bufnr, true, win_opts)
    
    -- Set window options
    vim.api.nvim_win_set_option(claude_winid, 'wrap', true)
    vim.api.nvim_win_set_option(claude_winid, 'cursorline', true)
  end
  
  -- Go to end of buffer
  vim.cmd('normal! G$')
end

function M.setup()
  -- Create the ClaudeChat command that opens floating window
  vim.api.nvim_create_user_command('ClaudeChat', create_floating_window, {})
end

return M