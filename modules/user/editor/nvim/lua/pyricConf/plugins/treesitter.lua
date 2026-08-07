require("nvim-treesitter").setup({})
require("nvim-treesitter").install({
  sync_install = false,
  auto_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
})
