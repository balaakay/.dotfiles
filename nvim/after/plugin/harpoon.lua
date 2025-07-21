local harpoon = require("harpoon")

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
vim.keymap.set("n", "<leader><C-h>", function() ui.nav_file(5) end)
vim.keymap.set("n", "<leader><C-j>", function() ui.nav_file(6) end)
vim.keymap.set("n", "<leader><C-k>", function() ui.nav_file(7) end)
vim.keymap.set("n", "<leader><C-l>", function() ui.nav_file(8) end)




-- This is my harpoon 2 config
--
-- harpoon:setup({ settings = {
--     -- Global settings (currently unused)
--   },
--   default = {
--     -- Default configuration for any list
--     save_on_toggle = true,
--     sync_on_ui_close = true,
--   },
--   -- Named list configurations (optional)
--   my_named_list = {
--     save_on_toggle = false, -- Override default behavior for this list
--     key = function()
--       return "<leader>m" -- Custom keybinding for this list
--     end,
--   },
-- })
--
-- vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: add file to jump list" })
-- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: toggle UI" })
--
-- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end, { desc = "Harpoon: select file 1" })
-- vim.keymap.set("n", "<C-j>", function() harpoon:list():select(2) end, { desc = "Harpoon: select file 2" })
-- vim.keymap.set("n", "<C-k>", function() harpoon:list():select(3) end, { desc = "Harpoon: select file 3" })
-- vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon: select file 4" })
-- -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
--
-- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = "Harpoon: Alternate files, Previous" })
-- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = "Harpoon: Alternate files, Next" })
--
--
-- -- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require("telescope.pickers").new({}, {
--     prompt_title = "Harpoon",
--     finder = require("telescope.finders").new_table({
--       results = file_paths,
--     }),
--     previewer = conf.file_previewer({}),
--     sorter = conf.generic_sorter({}),
--   }):find()
-- end
--
-- vim.keymap.set("n", "<C-t>t", function() toggle_telescope(harpoon:list()) end,
-- { desc = "Open harpoon window" })
