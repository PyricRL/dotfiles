vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  settings = {
    Rust = {
      diagnostics = { enable = true, },
    },
  },
})

vim.lsp.config("qmlls", {
  cmd = { "qmlls" },
  filetypes = { "qml" },
})

vim.lsp.config("nixd", {})

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Code Rename" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover (alt)" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("qmlls")
vim.lsp.enable("nixd")

