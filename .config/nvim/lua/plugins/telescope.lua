return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<S-Down>"] = require("telescope.actions").cycle_history_next,
          ["<S-Up>"] = require("telescope.actions").cycle_history_prev,
        },
      },
    },
  },
}
