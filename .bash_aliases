# black, red, green, yellow, blue, purple, cyan
txtblk='\e[0;30m'; txtred='\e[0;31m'; txtgrn='\e[0;32m';
txtylw='\e[0;33m'; txtblu='\e[0;34m'; txtpur='\e[0;35m'; txtcyn='\e[0;36m';

# blue, purple, cyan, white, reset
bakblu='\e[44m'; bakpur='\e[45m'; bakcyn='\e[46m'; bakwht='\e[47m'; txtrst='\e[0m';

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\\""[$(tput setaf 7)\\]\[$txtcyn\]$USER@`hostname`:\\w \$(parse_git_branch)$ \\[$(tput sgr0)\\]\[$txtrst\]"

based=`readlink -f $HOME/env`

test -f $HOME/tmux_completion.sh && . $HOME/tmux_completion.sh
test -f $HOME/git-completion.bash && . $HOME/git-completion.bash
export EDITOR="nvim"
export SHELL=/bin/bash
export HISTSIZE=""
export HISTFILESIZE=""
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias xterm="uxterm -bg black -fg white"
alias a6="setxkbmap -option ctrl:nocaps;xmodmap $HOME/.Xmodmap"
alias dk="setxkbmap se -option;"
alias rm="trash-put"
alias kx='f() { [ "$1" ] && kubectl config use-context $1 || kubectl config current-context ; } ; f'
alias kn='f() { [ "$1" ] && kubectl config set-context --current --namespace $1 || kubectl config view --minify | grep namespace | cut -d" " -f6 ; } ; f'

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

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

bind -x '"\C-o": ranger-cd;'

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

o-vecka-nu() { echo "1 + `date '+%U'`" | bc; }

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  :
else
  mac
fi
