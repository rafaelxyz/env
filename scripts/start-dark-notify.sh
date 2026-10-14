#!/usr/bin/env bash
# Link the tracked watcher and launch agent, then start it for this login.
set -euo pipefail

if [[ $(uname -s) != Darwin ]]; then
    echo 'This setup only runs on macOS.' >&2
    exit 1
fi

root=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
if [[ ! -x /opt/homebrew/bin/dark-notify ]]; then
    echo 'Installing dark-notify from its Homebrew tap...'
    /opt/homebrew/bin/brew install cormacrelf/tap/dark-notify
fi

install_link() {
    local src=$1 dst=$2
    mkdir -p "$(dirname "$dst")"
    if [[ -e "$dst" || -L "$dst" ]]; then
        if [[ "$src" -ef "$dst" ]]; then
            return 0
        fi
        printf 'Will not overwrite existing file: %s\n' "$dst" >&2
        exit 1
    fi
    ln -s "$src" "$dst"
}

install_link "$root/.local/bin/tmux-appearance" "$HOME/.local/bin/tmux-appearance"
install_link "$root/Library/LaunchAgents/dev.rafael.tmux-appearance.plist" \
    "$HOME/Library/LaunchAgents/dev.rafael.tmux-appearance.plist"

label=dev.rafael.tmux-appearance
domain="gui/$(id -u)"
agent="$HOME/Library/LaunchAgents/$label.plist"

# Replace an older instance if this script is run again.
if launchctl print "$domain/$label" >/dev/null 2>&1; then
    launchctl bootout "$domain/$label"
fi
launchctl bootstrap "$domain" "$agent"
launchctl kickstart -k "$domain/$label"

# Apply the current macOS appearance to any tmux server that is already open.
if command -v tmux >/dev/null 2>&1 && tmux has-session >/dev/null 2>&1; then
    tmux source-file "$HOME/.tmux.conf"
    "$HOME/.local/bin/tmux-appearance"
fi

echo "dark-notify launch agent started ($domain/$label)."
echo "Check: launchctl print '$domain/$label' | grep -E 'state =|pid ='"
