vim.pack.add({
  {
    src = "https://github.com/saghen/blink.cmp",
    version = "v1",
  },
})

require("blink.cmp").setup({
  keymap = {
    preset = "default",

    ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
    ["<S-Tab>"] = { "snippet_backward", "fallback" },
  },

  -- signature = { enabled = true },

  completion = {
    documentation = { auto_show = false },
    ghost_text = { enabled = true },
    menu = { auto_show = true },
    trigger = {
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_blocked_trigger_characters = function()
        if vim.bo.filetype == "mcfunction" then
          return { "\n", "\t" }
        end
        return { " ", "\n", "\t" }
      end,
    },
  },

  appearance = {
    nerd_font_variant = "mono",
  },

  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    per_filetype = {
      lua = { inherit_defaults = true, "lazydev" },
    },
    providers = {
      snippets = { score_offset = -3 },
      buffer = { score_offset = -5 },
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },

  snippets = { preset = "luasnip" },

  fuzzy = {
    implementation = "lua",
    sorts = { "exact", "score", "sort_text" },
  },
})
