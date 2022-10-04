-- Load all config files
require('options')
require('keymaps')
require('commands')
require('plugins')

-- PLUGINS
require('mason').setup()
require('nvim-tree').setup()
require("symbols-outline").setup()

-- lspconfig setup
require'lspconfig'.pyright.setup{}
require'lspconfig'.elmls.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.marksman.setup{}
require'lspconfig'.puppet.setup{}
require'lspconfig'.clangd.setup{}
require'lspconfig'.sumneko_lua.setup{
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim', 'solarized', 'packer_group', 'config_group'},
      },
    },
  },
}

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
