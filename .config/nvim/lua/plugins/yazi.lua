return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- Preserve the former Ranger key and its working-directory behavior.
    { "<leader>y", "<cmd>Yazi toggle<cr>", desc = "Yazi (toggle)" },
  },
  opts = {
    open_for_directories = false,
  },
}
