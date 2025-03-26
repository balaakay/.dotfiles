local builtin = require('telescope.builtin')

-- general find files. Not sure how much this differs from git find because I usually
-- only see files from inside my project directory. Maybe it adds gitignore files?
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })

-- search files inside git
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find files' })

-- This stands for edit neovim. will automatically open a find_files window
-- from within the config/neovim directory
vim.keymap.set('n', '<leader>en', function()
  builtin.find_files {
    cwd = vim.fn.stdpath("config")
  }
end)

--this allows you to grep any string inside the project you are in
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)



vim.keymap.set('n', '<leader>fh', builtin.help_tags)
