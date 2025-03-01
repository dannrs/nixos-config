local M = {}

function M.cowboy()
  ---@type table?
  local id
  local ok = true
  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local count = 0
    local timer = assert(vim.loop.new_timer())
    local map = key
    vim.keymap.set("n", key, function()
      if vim.v.count > 0 then
        count = 0
      end
      if count >= 10 then
        ok, id = pcall(vim.notify, "Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          replace = id,
          keep = function()
            return count >= 10
          end,
        })
        if not ok then
          id = nil
          return map
        end
      else
        count = count + 1
        timer:start(2000, 0, function()
          count = 0
        end)
        return map
      end
    end, { expr = true, silent = true })
  end

  -- Function to handle arrow key presses
  local function arrow_warning()
    ok, id = pcall(vim.notify, "Arrow keys are disabled!", vim.log.levels.WARN, {
      icon = "🚫",
      replace = id,
    })
    if not ok then
      id = nil
    end
  end

  -- Disable arrow keys in normal, visual, and insert modes with warning
  local arrow_keys = { "<Up>", "<Down>", "<Left>", "<Right>" }
  for _, key in ipairs(arrow_keys) do
    vim.keymap.set("n", key, arrow_warning, { silent = true })
    vim.keymap.set("v", key, arrow_warning, { silent = true })
    vim.keymap.set("i", key, arrow_warning, { silent = true })
  end
end

return M
