require("blink.cmp").setup({
  keymap = { preset = "super-tab" },

  completion = {
    documentation = { auto_show = true, auto_show_delay_ms = 0 },
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
})
