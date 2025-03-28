local builtin = require('telescope.builtin')

-- general find files. Not sure how much this differs from git find because I usually
-- only see files from inside my project directory. Maybe it adds gitignore files?
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope: find files' })

-- search files inside git
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Telescope: git files' })

-- This stands for edit neovim. will automatically open a find_files window
-- from within the config/neovim directory
--
-- Will this need to be OS specific? will my macOS .dotfiles be in the same place?
vim.keymap.set('n', '<leader>en', function()
  builtin.find_files {
    cwd = os.getenv("HOME") .. "/.dotfiles/nvim/"
  }
end, { desc = "Telescope: edit neovim via dotfiles" })

--this allows you to grep any string inside the project you are in
vim.keymap.set('n', '<leader>gs', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Telescope: search via grep string" })



vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Telescope: find help tags" })


vim.keymap.set('n', '<leader>fk', builtin.keymaps, {desc = "Telescope: find keymaps" })
