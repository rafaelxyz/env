return {
  "FabijanZulj/blame.nvim",
  keys = { {"<leader>gt", "<cmd>BlameToggle<CR>", desc="BlameToggle"}},
  config = function()
    require("blame").setup()
  end
}
