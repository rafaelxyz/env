# Aliases, prompt, and interactive helper functions.

export EDITOR=nvim VISUAL=nvim PAGER=less
export LANG="${LANG:-en_US.UTF-8}"
export LG_CONFIG_FILE="${LG_CONFIG_FILE:-$HOME/.config/lazygit/config.yml}"
export HISTSIZE=50000
export HISTFILESIZE=100000

# Avoiding loss across concurrent tmux panes.
shopt -s histappend

# Ignore consecutive duplicates and commands starting with a space
export HISTCONTROL=ignoreboth

# Store timestamps
export HISTTIMEFORMAT='%F %T '

set -o vi

# One Git invocation instead of 'git branch | sed' on every prompt.
parse_git_branch() {
    local branch
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || return 0
    printf ' (%s)' "$branch"
}
PS1='\[\e[36m\]\u@\h:\w\[\e[0m\]$(parse_git_branch)\$ '

alias vi=nvim
alias k=kubectl
alias g=git
alias grep='grep --color=auto'
if [[ $OSTYPE == darwin* ]]; then
    alias ls='ls -G'          # macOS BSD ls
else
    alias ls='ls --color=auto'
fi
alias ll='ls -lah'

# 'rm' is intentionally redirected to the trash for interactive use.
if command -v trash-put >/dev/null 2>&1; then
    alias rm='trash-put'
fi

rgg() {
    rg --vimgrep "$@" | nvim -q /dev/stdin
}

ranger_cd() {
    local temp_file chosen_dir
    temp_file=$(mktemp "${TMPDIR:-/tmp}/ranger_cd.XXXXXXXXXX") || return 1

    if command ranger --choosedir="$temp_file" -- "${@:-$PWD}"; then
        if IFS= read -r chosen_dir < "$temp_file"; then
            if [[ -n $chosen_dir && $chosen_dir != "$PWD" ]]; then
                builtin cd -- "$chosen_dir"
            fi
        fi
    fi
    # Never allow alias rm=trash-put to trash an internal temp file.
    command rm -f -- "$temp_file"
}

# Ctrl+O opens ranger and returns to its chosen directory.
bind '"\C-o":"ranger_cd\C-m"'

o-color-print() {
    local i
    for ((i = 0; i < 256; i++)); do
        printf '\033[38;5;%smcolour%s\n' "$i" "$i"
    done
    printf '\033[0m'
}

# Intentional safety change: remove unused resources, with Docker confirmation.
o-docker-clean() {
    docker system prune --all --volumes
}

# Preserve the previous definition: Sunday-based week number plus one.
o-vecka-nu() {
    local week
    week=$(date +%U) || return
    printf '%d\n' "$((10#$week + 1))"
}
