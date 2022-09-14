-- Load all config files
require('options')
require('keymaps')
require('commands')
require('plugins')
if os.getenv('WSL_DISTRO_NAME') then
  vim.o.background = 'dark'
end
require('themes')  -- Theme at the end, to prevent overwrite by other plugins
