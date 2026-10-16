return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    opts = {
      provider = "cursor",
      mode = "agentic",

      behaviour = {
        auto_suggestions = false,
      },

      acp_providers = {
        cursor = {
          command = os.getenv("HOME") .. "/.local/bin/agent",
          args = { "acp" },
          auth_method = "cursor_login",
          env = {
            HOME = os.getenv("HOME"),
            PATH = os.getenv("PATH"),
          },
        },
      },
    },

    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",

      -- Required by newer Avante versions
      {
        "ColinKennedy/mega.cmdparse",
        dependencies = {
          "ColinKennedy/mega.logging",
        },
      },

      "nvim-tree/nvim-web-devicons",

      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
