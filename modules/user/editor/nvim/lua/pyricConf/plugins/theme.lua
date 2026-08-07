vim.g.ayucolor = "dark"

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    pcall(vim.cmd.colorscheme, "ayu")

    local palette = {
      err = "#3d2429",
      warn = "#3a3024",
      info = "#242f3d",
      hint = "#24373d",
    }

    vim.api.nvim_set_hl(0, "DiagnosticErrorLine", { bg = palette.err, blend = 20 })
    vim.api.nvim_set_hl(0, "DiagnosticWarnLine",  { bg = palette.warn, blend = 15 })
    vim.api.nvim_set_hl(0, "DiagnosticInfoLine",  { bg = palette.info, blend = 10 })
    vim.api.nvim_set_hl(0, "DiagnosticHintLine",  { bg = palette.hint, blend = 10 })

    vim.api.nvim_set_hl(0, "IblMutedLines", { fg = "#1e1e24", nocombine = true })
    vim.api.nvim_set_hl(0, "IblMutedScope", { fg = "#3d3d3d", nocombine = true })
  end,
})
