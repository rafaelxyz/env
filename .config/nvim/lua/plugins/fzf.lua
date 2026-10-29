return {
  {
    "ibhagwan/fzf-lua",
    opts = function(_, opts)
      local actions = require("fzf-lua.actions")

      for _, picker in ipairs({ "files", "grep" }) do
        opts[picker] = opts[picker] or {}
        opts[picker].actions = opts[picker].actions or {}

        opts[picker].actions["ctrl-h"] = {
          actions.toggle_hidden,
        }

        opts[picker].actions["ctrl-i"] = {
          actions.toggle_ignore,
        }
      end
    end,
  },
}
