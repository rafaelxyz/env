#!/usr/bin/env python

""" environment setup """

import os
from os.path import join
from os.path import expanduser
from subprocess import call


class TermColors(object):  # pylint: disable=R0903
    ''' Terminal color codes '''
    __slots__ = ['header', 'blue', 'green', 'grey', 'warning', 'fail', 'end']

    def __init__(self):
        self.header = '\033[95m'
        self.blue = '\033[94m'
        self.green = '\033[92m'
        self.grey = '\033[90m'
        self.warning = '\033[93m'
        self.fail = '\033[91m'
        self.end = '\033[0m'

COLOR = TermColors()


def symlink(source, link):
    """ unix symlink """
    print COLOR.blue + 'creating symlink ', link, 'source:', source, COLOR.end
    if not os.path.isdir(os.path.dirname(link)):
        os.makedirs(os.path.dirname(link))
    return call(['ln', '-s', source, link])

def setup_environment():
    """ Does it all """
    home = expanduser('~')
    envd = join(home, 'env')
    confd = os.getcwd() + '/config'

    print 'home', home, 'confd', confd

    # symlink this to home if not already there
    if not os.path.isdir(envd):
        symlink(os.getcwd(), envd)

    # add sourcing of our bashrc
    res = os.system("grep 'source %s/bashrc' %s" % (confd, home + '/.bashrc'))
    if res:
        os.system("echo 'source %s/bashrc' >> %s" % (confd, home + '/.bashrc'))

    # symlink config files
    symlink(confd + '/init.vim', home + '/.vimrc')
    symlink(confd + '/init.vim', home + '/.config/nvim/init.vim')
    symlink(confd + '/config.js', home + '/.config/vimfx/config.js')
    symlink(confd + '/inputrc', home + '/.inputrc')
    symlink(confd + '/tmux_conf', home + '/.tmux_conf')
    symlink(confd + '/Xresources', home + '/.Xresources')
    symlink(confd + '/ycm_extra_conf.py', home + '/.ycm_extra_conf.py')
    symlink(confd + '/rc.conf', home + '/.config/ranger/rc.conf')


    # vim-plug
    url = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    os.system('curl -fLo %s/.vim/autoload/plug.vim --create-dirs %s'
              % (home, url))
    os.system('curl -fLo %s/.config/nvim/autoload/plug.vim --create-dirs %s'
              % (home, url))

    os.system('git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm')
    os.system('git clone https://github.com/ranger/ranger.git')
    os.system('git clone https://github.com/alexanderjeurissen/ranger_devicons.git')
    os.system('xrdb ~/.Xresources')
    os.system('wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage')
    os.system('chmod u+x nvim.appimage')
    os.system('cp nvim.appimage /usr/bin/vi')
    os.system('cp nvim.appimage /usr/bin/vim')


setup_environment()
