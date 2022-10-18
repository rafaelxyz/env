local actions = require('telescope.actions')

require('telescope').setup({
  defaults = { sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        height = 47,
        prompt_position = "top",
      }
    }
  },
})
