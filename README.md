Settings and apps for linux

ubuntu:
    sudo apt-get install git ranger tmux trash-cli exuberant-ctags

    neovim:
        sudo apt-get install software-properties-common
        sudo apt-add-repository ppa:neovim-ppa/stable
        sudo apt-get update
        sudo apt-get install neovim
        sudo apt-get install python-dev python-pip python3-dev python3-pip
        sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
        sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
