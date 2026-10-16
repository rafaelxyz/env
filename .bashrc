# ~/.bashrc: interactive Bash (both login and non-login).
[[ $- == *i* ]] || return 0

export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if [[ -d $PYENV_ROOT/bin ]]; then
    case ":$PATH:" in
        *":$PYENV_ROOT/bin:"*) ;;
        *) PATH="$PYENV_ROOT/bin:$PATH" ;;
    esac
fi
export PATH

# Only one pyenv initialization. Explicit 'bash' skips shell detection.
if command -v pyenv >/dev/null 2>&1; then
    eval "$(pyenv init --no-rehash - bash)"
fi

case $OSTYPE in
    darwin*)
        # Do not eagerly load many duplicate GDAL/OGR compat files.
        export BASH_COMPLETION_COMPAT_IGNORE='@(gdal?*|ogr*|sozip)'
        [[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]] && \
            source /opt/homebrew/etc/profile.d/bash_completion.sh
        ;;
    linux*)
        # Bash completion may already be initialized system-wide.
        if [[ -z ${BASH_COMPLETION_VERSINFO+x} && -r /usr/share/bash-completion/bash_completion ]]; then
            source /usr/share/bash-completion/bash_completion
        fi
        ;;
esac

[[ -r $HOME/.bash_aliases ]] && source "$HOME/.bash_aliases"

# LazyGit theme is selected when LazyGit starts, not when Bash starts.
if [[ $OSTYPE == darwin* ]]; then
    lazygit() {
        local lg_dir="$HOME/Library/Application Support/lazygit"
        local base="$lg_dir/config.yml"
        local theme="$lg_dir/light.yml"

        # Keep your existing macOS config; fall back to XDG config if absent.
        [[ -r $base ]] || base="${LG_CONFIG_FILE:-$HOME/.config/lazygit/config.yml}"
        [[ $(defaults read -g AppleInterfaceStyle 2>/dev/null) == Dark ]] && \
            theme="$lg_dir/dark.yml"

        if [[ -r $theme ]]; then
            LG_CONFIG_FILE="$base,$theme" command lazygit "$@"
        else
            LG_CONFIG_FILE="$base" command lazygit "$@"
        fi
    }
fi

if command -v pokemon-colorscripts >/dev/null 2>&1; then
    pokemon-colorscripts -r
fi
