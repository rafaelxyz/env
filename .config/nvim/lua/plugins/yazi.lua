return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- Preserve the former Ranger key and its working-directory behavior.
    { "<leader>r", "<cmd>Yazi cwd<cr>", desc = "Yazi (working directory)" },
    { "<leader>R", "<cmd>Yazi<cr>", desc = "Yazi (current file)" },
  },
  opts = {
    open_for_directories = false,
  },
}
