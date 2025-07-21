-- vim.keymap.set("n", "<leader>gi", vim.cmd.Git, { desc = "Git via fugitive" })
-- Toggle Fugitive (Git) window with <leader>g
vim.keymap.set("n", "<leader>gi", function()
  -- Is the Fugitive buffer already open in any window?
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "fugitive" then
      -- Close it
      vim.api.nvim_win_close(win, false)
      return
    end
  end

  -- Not open → open it
  vim.cmd("Git")
end, { silent = true })
