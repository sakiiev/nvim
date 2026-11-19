vim.pack.add({
  "https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
  open_mapping = [[<c-\>]],

  size = 12,
  direction = "float",

  shade_terminals = false,
})
