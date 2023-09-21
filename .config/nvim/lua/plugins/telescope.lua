local actions = require('telescope.actions')

require('telescope').setup({
  defaults = { sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        height = 47,
        prompt_position = "top",
      }
    },
    mappings = {
      i = {
        ["<S-Down>"] = require('telescope.actions').cycle_history_next,
        ["<S-Up>"] = require('telescope.actions').cycle_history_prev,
      },
    },
  },
})
