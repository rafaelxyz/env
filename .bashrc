# black, red, green, yellow, blue, purple, cyan
txtblk='\e[0;30m'; txtred='\e[0;31m'; txtgrn='\e[0;32m';
txtylw='\e[0;33m'; txtblu='\e[0;34m'; txtpur='\e[0;35m'; txtcyn='\e[0;36m';

# blue, purple, cyan, white, reset
bakblu='\e[44m'; bakpur='\e[45m'; bakcyn='\e[46m'; bakwht='\e[47m'; txtrst='\e[0m';

#test $0 == /usr/sbin/Check && exit 0
#echo -e "$txtylw- running bashrc, calling program is: $0$txtrst\n"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\\""[$(tput setaf 7)\\]\[$txtcyn\]$USER@`hostname`:\\w \$(parse_git_branch)$ \\[$(tput sgr0)\\]\[$txtrst\]"

based=`readlink -f $HOME/env`
confd=$based/conf
home="/home/erafodz"

test -f $home/tmux_completion.sh && . $home/tmux_completion.sh
test -f $home/git-completion.bash && . $home/git-completion.bash
export EDITOR="vim"
export SHELL=/bin/bash
export TERM=xterm-256color
#alias vi="vim"
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias info=viminfo
alias grep="grep --color=auto"
alias xterm="uxterm -bg black -fg white"
alias mail="mail -r rafael.odzakow@ericsson.com"
alias a6="setxkbmap -option ctrl:nocaps;xmodmap $based/dvorak/xmodmap2"
alias dk="setxkbmap se -option;"
alias rm="trash-put"
bind '"\C-o":"ranger-cd\C-m"'
export HISTSIZE=""
export HISTFILESIZE=""


# Functions

mac() {
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  set -o vi
  alias vi="nvim"
  export PATH=/opt/homebrew/bin:$PATH
  set EDITOR nvim
  set VISUAL nvim
  set PAGER nvim
  eval "$(pyenv init -)"
  [ -f /opt/homebrew/etc/bash_completion ] && . /opt/homebrew/etc/bash_completion
  alias kubectl="minikube kubectl --"
}

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    local rngr=ranger
    test $WSL_DISTRO_NAME && rngr=$based/ranger/ranger.py;
    EDITOR=nvim VISUAL=nvim $rngr --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi
    rm -f -- "$tempfile"
}

o-color-print() {
    # for use in tmux
    for i in {0..255} ; do
        printf "\x1b[38;5;${i}mcolour${i}\n"
    done
}

o-docker-clean() {
    docker rm -f $(docker ps -a|awk '{print $1}'|tail -n +2)
    docker rmi -f $(docker image ls |awk '{print $3}'|tail -n +2)
    docker volume rm $(docker volume ls |awk '{print $2}'|tail -n +2)
}

man() { /usr/bin/man $* | col -b | vim -c 'set ft=man nomod nolist' -; }
o-bashrc() { vim -c "e $confd/bashrc"; }
o-vecka-nu() { echo "1 + `date '+%U'`" | bc; }

mac
