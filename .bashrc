if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [[ "$(uname -s)" == "Darwin" ]]; then
  export GDAL_LIBRARY_PATH=$(brew --prefix gdal)/bin/gdal
  export GEOS_LIBRARY_PATH=$(brew --prefix geos)/bin/geosop

  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
  export PATH="$HOME/.local/bin:$PATH"

  lazygit() {
      local theme
      local lg_config_dir="/Users/rafal/Library/Application Support/lazygit/"

      if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
          theme="$lg_config_dir/dark.yml"
      else
          theme="$lg_config_dir/light.yml"
      fi

      LG_CONFIG_FILE="$lg_config_dir/config.yml,$theme" \
          command lazygit "$@"
  }

fi
