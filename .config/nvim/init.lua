-- Load all config files
require('options')
require('keymaps')
require('commands')
require('plugins')

-- PLUGINS
require('mason').setup()
require("symbols-outline").setup({
    position = 'left',
})
require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})
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

if os.getenv('WSL_DISTRO_NAME') then
  vim.o.background = 'dark'
end
require('themes')  -- Theme at the end, to prevent overwrite by other plugins
