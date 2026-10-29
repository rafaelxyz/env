return {
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
(つ◉益◉)つ NeOvIM 💣🌟
░░░    ░░ ░░    ░░ ░░ ░░░    ░░░ 
▒▒▒▒   ▒▒ ▒▒    ▒▒ ▒▒ ▒▒▒▒  ▒▒▒▒ 
▒▒ ▒▒  ▒▒ ▒▒    ▒▒ ▒▒ ▒▒ ▒▒▒▒ ▒▒ 
▓▓  ▓▓ ▓▓  ▓▓  ▓▓  ▓▓ ▓▓  ▓▓  ▓▓ 
██   ████   ████   ██ ██      ██ ]],
        }
      },
      picker = {
        sources = {
          files = {
             win = {
              input = {
                keys = {
                  ["<C-h>"] = "toggle_hidden",
                  ["<C-i>"] = "toggle_ignored",
                },
              },
            },
          },
          grep = {
             win = {
              input = {
                keys = {
                  ["<C-h>"] = "toggle_hidden",
                  ["<C-i>"] = "toggle_ignored",
                },
              },
            },
          },
        },
      },
    },
  },
}
