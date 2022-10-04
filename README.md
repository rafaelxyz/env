# Install

stow .

# Requirements for macos
brew install ripgrep tmux pipx

# Requirements for Ubuntu
sudo apt-get install git ranger tmux trash-cli exuberant-ctags -y

# Neovim install
sudo apt-get install software-properties-common -y && sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update && sudo apt-get install neovim python-dev python-pip python3-dev python3-pip -y
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vi

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
