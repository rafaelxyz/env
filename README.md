Settings and apps for linux

ubuntu:
    sudo apt-get install git ranger tmux trash-cli exuberant-ctags -y

    neovim:
        sudo apt-get install software-properties-common -y && sudo apt-add-repository ppa:neovim-ppa/stable
        sudo apt-get update && sudo apt-get install neovim python-dev python-pip python3-dev python3-pip -y
        sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
        sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
