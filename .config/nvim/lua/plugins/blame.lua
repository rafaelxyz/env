return {
  "FabijanZulj/blame.nvim",
  keys = { {"<leader>gB", "<cmd>BlameToggle<CR>", desc="BlameToggle"}},
  config = function()
    require("blame").setup()
  end
}
