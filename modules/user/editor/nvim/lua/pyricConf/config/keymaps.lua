local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })

map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

map("n", "gl", "$", { desc = "Go to end of line" })
map("n", "gh", "^", { desc = "Go to start of line" })

map("n", "==", "gg<S-v>G")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("v", "p", '"_dP', opts)

map("n", "<C-c>", ":%y+<CR>", opts)

map("n", "zv", "zMzvzz", { desc = "Close all folds except the current one" })
map("n", "zj", "zcjzOzz", { desc = "Close current fold when open. Always open next fold." })
map("n", "zk", "zckzOzz", { desc = "Close current fold when open. Always open previous fold." })
