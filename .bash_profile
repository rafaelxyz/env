if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
if [[ "$(uname -s)" == "Darwin" ]]; then
  # The following lines were added by Docker Desktop to add commands to your PATH.
  export PATH="$PATH:/Users/rafal/.docker/bin"
  # End of Docker Desktop section.
  eval "$(/opt/homebrew/bin/brew shellenv)"
  export PATH="/opt/homebrew/opt/trash-cli/bin:$PATH"
  export PATH="/opt/homebrew/opt/node@20/bin:$PATH"

  if type brew &>/dev/null
  then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]
    then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*
      do
        [[ -r "${COMPLETION}" ]] && source "${COMPLETION}"
      done
    fi
  fi
fi

