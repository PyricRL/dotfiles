require("nvim-tree").setup({
  view = {
    adaptive_size = true,
  }
})

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle nvim tree" })
