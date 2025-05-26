vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open NetRW" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line up" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move cursor down half page & center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move cursor up half page & center" })

--these two functions do not work on my linux desktop
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"i", "v"}, "<C-c>", "<Esc>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "auto populate command line with search syntax" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>",
  { desc = "Tmux sessionizer" })


--custom balaakay keybinds

--Python (must be in virtual environment)
vim.keymap.set("n", "<leader>py", ":w<CR>:!python %<CR>", { desc = "Run python script" })

--Java (compile the file you are editing)
vim.keymap.set("n", "<leader>jc", ":w<CR>:javac %<CR>", { desc = "compile java file" })

-- Define a function for the keybind
local function jsxStringNotation()
  -- vim.api.nvim_feedkeys('a',"n", false)
  -- vim.api.nvim_put({ '{""}' }, "c", false, true)
  vim.api.nvim_feedkeys('a{""}', "n", false)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c><Left><Left>", true, false, true), "n", false)
  vim.api.nvim_feedkeys('a', "n", false)
  -- vim.api.nvim_feedkeys('$F"i', "n", false)
  -- vim.api.nvim_feedkeys('a',"n", false)
end

-- Set up the autocmd to apply the keybind for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    -- Set the keybind (e.g., <leader>q) for the current buffer
    vim.keymap.set("n", "<leader>js", jsxStringNotation, { buffer = true })
  end,
})

