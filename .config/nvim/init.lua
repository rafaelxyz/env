-- Load all config files
require('options')
require('keymaps')
require('commands')
require('plugins')

-- PLUGINS
require('mason').setup()
require('nvim-tree').setup()
require("symbols-outline").setup()

local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

-- custom plugin configs
require("plugins.bufferline")
require('plugins.lualine')
require('plugins.telescope')
require('plugins.treesitter')
require('plugins.which-key')
require('plugins.neoscroll')
require('plugins.toggleterm')
require('plugins.project_nvim')

if os.getenv('WSL_DISTRO_NAME') then
  vim.o.background = 'dark'
end
require('themes')  -- Theme at the end, to prevent overwrite by other plugins
