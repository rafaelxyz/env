# Docker Desktop
export PATH="$PATH:$HOME/.docker/bin"

# Homebrew (macOS)
if [[ "$OSTYPE" == darwin* ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"
    export PATH="/opt/homebrew/opt/node@20/bin:$PATH"
fi

# Interactive shell configuration
if [[ -f "$HOME/.bashrc" ]]; then
    source "$HOME/.bashrc"
fi

# Bash completion
if [[ "$-" == *i* && "$OSTYPE" == darwin* ]]; then
    # Skip duplicate GDAL/OGR completion scripts, but retain 'gdal'
    export BASH_COMPLETION_COMPAT_IGNORE='@(gdal?*|ogr*|sozip)'

    if [[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]]; then
        source /opt/homebrew/etc/profile.d/bash_completion.sh
    fi
fi
