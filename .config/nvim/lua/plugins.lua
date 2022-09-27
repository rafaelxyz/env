-- Plugin definition and loading

-- Boostrap Packer
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
end

-- Rerun PackerCompile when saving this file
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = { 'plugins.lua' }
})

-- Source lua config files on save
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile>',
  group = config_group,
  pattern = { 'commands.lua', 'keymaps.lua', 'options.lua', 'which-key.lua', 'utils.lua' }
})

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim', -- Manage packer
    'tpope/vim-commentary', -- gc in visual select to comment out/in code
    'christoomey/vim-tmux-navigator', -- Navigation between tmux and vim windows
    'tpope/vim-fugitive', -- Git commands
    'axelf4/vim-strip-trailing-whitespace', -- :StripTrailingWhitespace for whole file
    'moll/vim-bbye', -- Bdelete, maintain splits when removing buffer
    'altercation/vim-colors-solarized',
    'overcache/neosolarized',
    'simrat39/symbols-outline.nvim',

    -- Plugins with custom configs
    'karb94/neoscroll.nvim',
    'folke/which-key.nvim',
    'ahmedkhalf/project.nvim',
    'neovim/nvim-lspconfig', -- Collection of configurations for the built-in LSP client
    'williamboman/mason.nvim', -- Manage language packages
  }

  use { 'francoiscabrol/ranger.vim', requires = { 'rbgrouleff/bclose.vim' } } -- Ranger
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }, }
  use { 'lewis6991/gitsigns.nvim', config = function() require('gitsigns').setup() end, requires = { 'nvim-lua/plenary.nvim' }, }

  -- Plugins with custom configs
  use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }, tag = 'nightly' } -- optional, updated every week. (see issue #1193)
  use { 'akinsho/toggleterm.nvim', tag = 'v1.*', }
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' }, }
  use { 'mhinz/vim-startify', config = function() local path = vim.fn.stdpath('config') .. '/lua/plugins/startify.vim' vim.cmd('source ' .. path) end }

  if packer_bootstrap then
    require('packer').sync()
  end

end)
-- vim: sw=2 ts=2 sts=2 nowrap
