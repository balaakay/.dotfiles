vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
--these two functions do not work on my linux desktop
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({"i", "v"}, "<C-c>", "<Esc>")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])


vim.keymap.set("n", "<leader>oc", ':OpenInChrome<CR>', { noremap = true, silent = true})
--vim.api.nvim_set_keymap('n', '<leader>oc',':!start "" "C:/Program Files/Google/Chrome/Application/chrome.exe" -ArgumentList " --disable-print-preview" "file:///%:p"<CR>', { noremap = true, silent = true })


--custom balaakay keybinds

--Python (must be in virtual environment)
vim.keymap.set("n", "<leader>py", ":w<CR>:!python %<CR>")

--Java (compile and run the file you are editing)
vim.keymap.set("n", "<leader>jc", ":w<CR>:javac %<CR>")

-- change control f to handle tmux-sessionizer. TODO
vim.keymap.set("", "<C-f>",function()
    vim.fn.system("tmux-sessionizer")
    vim.fn.system("echo hello")
end, {desc = "Open tmux-sessionizer"})
