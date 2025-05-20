txtcyn='\e[0;36m';
txtrst='\e[0m';

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\\""[$(tput setaf 7)\\]\[$txtcyn\]$USER@$(hostname):\\w \$(parse_git_branch)$ \\[$(tput sgr0)\\]\[$txtrst\]"

set -o vi
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export HISTSIZE=""
export HISTFILESIZE=""
alias vi="nvim"
alias ll="ls -lah --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias xterm="uxterm -bg black -fg white"
alias a6="setxkbmap se -option ctrl:nocaps;xmodmap ${HOME}/.Xmodmap"
alias dk="setxkbmap se -option;"
alias rm="trash-put"
alias k="kubectl"
alias g=git

rgg() {
  rg --vimgrep "$@" | nvim -q /dev/stdin
}

mac() {
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export PATH=/opt/homebrew/bin:$PATH
  eval "$(pyenv init -)"
}

ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    local rngr=ranger
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

if [[ $WSL_DISTRO_NAME ]]; then
  echo ">"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  a6
else
  mac
fi
