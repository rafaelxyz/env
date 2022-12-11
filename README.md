# Install

stow .

# Requirements for macos
brew install ripgrep tmux pipx code-minimap

# Requirements for Ubuntu
sudo apt-get install git ranger tmux trash-cli exuberant-ctags -y

# Neovim install

# Neovim appimage
cp nvim.appimage /usr/bin/vi
cp nvim.appimage /usr/bin/vim

# Ranger
git clone https://github.com/ranger/ranger.git && cd ranger/ && sudo make install

# X
xrdb ~/.Xresources

# Nvim

Reference
  https://github.com/miltonllera/neovim-lua-config

# Notes

Text object copy paste, repeat with .

	yiw
	ciw<C-r>0
