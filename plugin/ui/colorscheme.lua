vim.pack.add({
  "https://github.com/rose-pine/neovim",
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/f4z3r/gruvbox-material.nvim"
})

require("rose-pine").setup({
  highlight_groups = {
    VirtColumn = { fg = "overlay" },
  },
})

require("gruvbox").setup({
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = true,
    folds = true,
  },
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = function()
    local groups = {
      "SignColumn", "FoldColumn", "LineNr", "CursorLineNr",
      "GitSignsAdd", "GitSignsChange", "GitSignsDelete",
      "GitSignsTopdelete", "GitSignsChangedelete", "GitSignsUntracked",
      "DiagnosticSignError", "DiagnosticSignWarn",
      "DiagnosticSignInfo", "DiagnosticSignHint",
    }
    for _, name in ipairs(groups) do
      local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
      hl.bg = "NONE"
      vim.api.nvim_set_hl(0, name, hl)
    end
  end,
})

-- vim.cmd("colorscheme rose-pine")
-- vim.cmd("colorscheme gruvbox")
vim.cmd("colorscheme gruvbox")
