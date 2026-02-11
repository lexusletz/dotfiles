local M = {}

M.modifier_buffers = function()
  local status_ok, _ = pcall(require, "telescope")
  if not status_ok then
    vim.notify("Telescope not installed", vim.log.levels.ERROR)
    return
  end

  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  local modified_buffers = {}

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].modified then
      local name = vim.api.nvim_buf_get_name(bufnr)
      if name == "" then name = "[No name buffer]" end

      table.insert(modified_buffers, {
        bufnr = bufnr,
        filename = name,
        display = name .. "Modified",
      })
    end
  end

  -- If there is no modified buffers, show a message
  if #modified_buffers == 0 then
    vim.notify("No modified buffers", vim.log.levels.INFO)
    return
  end

  -- Create the picker from Telescope
  pickers.new({}, {
    prompt_title = "Unsaved Files",
    finder = finders.new_table({
      results = modified_buffers,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.display,
          ordinal = entry.filename,
          bufnr = entry.bufnr,
          filename = entry.filename,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    previewer = conf.file_previewer({}),
    attach_mappings = function(prompt_bufnr, map)
      -- Actions to go to buffer
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection and selection.bufnr then
          vim.api.nvim_win_set_buf(0, selection.bufnr)
        end
      end)

      -- Save the selected buffer
      map("i", "<C-s>", function()
        local selection = action_state.get_selected_entry()
        if selection and selection.bufnr then
          vim.api.nvim_buf_call(selection.bufnr, function()
            vim.cmd("write")
          end)

          -- Update the prompt to show that the file was saved
          vim.notify("Saved file: " .. selection.value.filename, vim.log.levels.INFO)

          -- Close and reopen to update the list
          actions.close(prompt_bufnr)

          vim.defer_fn(function()
            M.modifier_buffers()
          end, 100)
        end
      end)

      -- Save all the modified buffers
      map("i", "<C-a>", function()
        actions.close(prompt_bufnr)
        require("utils.buffers").save_all_modified()
      end)

      -- Close the selected buffer (after asking)
      map("i", "<C-d>", function()
        local selection = action_state.get_selected_entry()
        if selection and selection.bufnr then
          actions.close(prompt_bufnr)
          vim.api.nvim_win_set_buf(0, selection.bufnr)
          vim.cmd("confirm bdelete")

          vim.defer_fn(function()
            M.modifier_buffers()
          end, 100)
        end
      end)

      return true
    end,
  }):find()
end

return M
