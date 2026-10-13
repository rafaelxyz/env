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
                },
              },
            },
          },
          grep = {
             win = {
              input = {
                keys = {
                  ["<C-h>"] = "toggle_hidden",
                },
              },
            },
          },
        },
      },
    },
  },
}
