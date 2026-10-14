# Automatic tmux color scheme on macOS

Dark mode uses **Catppuccin Frappé** and light mode uses **Latte**; rounded
windows are preserved. This uses the existing `catppuccin/tmux#v2.3.1` TPM plugin.

## Install and start (once)

From the root of the dotfiles checkout, after applying the patch:

```bash
bash scripts/start-dark-notify.sh
```

This installs `cormacrelf/tap/dark-notify` if it is missing, creates symlinks
in `~/.local/bin` and `~/Library/LaunchAgents`, loads the launch agent, and
applies the current appearance to an existing tmux server. If the files are
already symlinked by Stow, the installer accepts them. It will not overwrite
unrelated existing files.

The `dark-notify` process stays running under your macOS graphical user session
via `launchd`, restarts if it exits, and starts again on login. It **must run on
your Mac**; applying a patch remotely cannot start it.

Check status:

```bash
launchctl print "gui/$(id -u)/dev.rafael.tmux-appearance" | grep -E 'state =|pid ='
pgrep -fl dark-notify
```

## Verify tmux switching

Ensure the Catppuccin TPM plugin has been installed (`prefix` + `I` inside
tmux, or run `~/.tmux/plugins/tpm/bin/install_plugins`). Then:

```bash
~/.local/bin/tmux-appearance dark
tmux show-option -gv @catppuccin_flavor  # frappe
~/.local/bin/tmux-appearance light
tmux show-option -gv @catppuccin_flavor  # latte
~/.local/bin/tmux-appearance               # return to macOS appearance
```

Switch appearance in **System Settings → Appearance** to verify live updates.
If there's no tmux session, the watcher stays running and tmux startup will
apply the correct appearance when you next start one.

## Stop / restart

```bash
launchctl bootout "gui/$(id -u)/dev.rafael.tmux-appearance"
launchctl bootstrap "gui/$(id -u)" "$HOME/Library/LaunchAgents/dev.rafael.tmux-appearance.plist"
```

To remove autostart, boot it out and unlink the LaunchAgent symlink.
Do not run a second `dark-notify -c ...` instance alongside launchd.

`dark-notify` source: https://github.com/cormacrelf/dark-notify
`catppuccin/tmux` source: https://github.com/catppuccin/tmux
