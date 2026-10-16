# Login shell: environment, then interactive Bash setup.

if [[ $OSTYPE == darwin* && -x /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Prefer these Homebrew programs over unversioned alternatives.
    [[ -d /opt/homebrew/opt/trash-cli/bin ]] && PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"
    [[ -d /opt/homebrew/opt/node@20/bin ]] && PATH="/opt/homebrew/opt/node@20/bin:$PATH"

    # GeoDjango requires the shared libraries, not bin/gdal or bin/geosop.
    [[ -r /opt/homebrew/opt/gdal/lib/libgdal.dylib ]] && \
        export GDAL_LIBRARY_PATH=/opt/homebrew/opt/gdal/lib/libgdal.dylib
    [[ -r /opt/homebrew/opt/geos/lib/libgeos_c.dylib ]] && \
        export GEOS_LIBRARY_PATH=/opt/homebrew/opt/geos/lib/libgeos_c.dylib
fi

[[ -d $HOME/.docker/bin ]] && PATH="$PATH:$HOME/.docker/bin"
[[ -d $HOME/.local/bin ]] && PATH="$PATH:$HOME/.local/bin"
export PATH

# Keep pyenv Python shims available for non-interactive login shells too.
export PYENV_ROOT="${PYENV_ROOT:-$HOME/.pyenv}"
if [[ -d $PYENV_ROOT/shims ]]; then
    case ":$PATH:" in
        *":$PYENV_ROOT/shims:"*) ;;
        *) PATH="$PYENV_ROOT/shims:$PATH" ;;
    esac
fi

# Explicitly load Bash's interactive configuration in login shells.
[[ -r $HOME/.bashrc ]] && source "$HOME/.bashrc"
