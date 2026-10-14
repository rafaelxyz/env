# Personal dotfiles

macOS (Homebrew/Kitty) and Linux shell/editor configurations.

## Bootstrap

Clone from a location of your choice:

```sh
git clone --recurse-submodules https://github.com/rafaelxyz/env.git
cd env
```

Preview what GNU Stow would link into your home directory **before** applying:

```sh
stow --no --verbose --target="$HOME" .
stow --verbose --target="$HOME" .
```

Existing conflicting home-directory files need to be backed up or moved before Stow can link them.
If submodules were not cloned, initialize them with `git submodule update --init --recursive`.
After Stow has linked `~/.tmux/plugins/tpm`, install the tmux plugins with:

```sh
"$HOME/.tmux/plugins/tpm/bin/install_plugins"
```

## macOS dependencies

```sh
brew install stow git tmux bash-completion@2 pyenv ranger ripgrep fd fzf lazygit git-delta trash-cli
```

For Kitty and Neovim install your preferred build, and install Fira Code and Symbols Nerd Font if using
this Kitty theme. The font archives are available at:

- [Fira Code](https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip)
- [Symbols Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.0/NerdFontsSymbolsOnly.zip)

Run `kitten themes` once to create `~/.config/kitty/current-theme.conf`, or leave it absent;
Kitty now uses an optional include. The `macos_option_as_alt left` setting reserves your right Option
for Swedish characters.

### Git credentials

The shared `.gitconfig` uses `osxkeychain`, which stores HTTPS credentials in macOS Keychain instead
of the plaintext Git credential store. The optional `~/.gitconfig.local` is included last for
machine-specific overrides. On **Linux**, put a credential helper available on that machine in
`~/.gitconfig.local`, explicitly resetting the macOS helper first. For example:

```gitconfig
[credential]
    helper =
    helper = libsecret
```

Also override any machine-specific signing paths there. Verify the effective credential helpers with:

```sh
git config --show-origin --get-all credential.helper
```

The Git SSH signing key and allowed-signers paths currently reference `/Users/rafal`; adjust these on
another computer before enabling signing there.

### Bash history

Bash keeps 50,000 entries in a session, up to 100,000 on disk, and writes new history after each
prompt. Multiple tmux panes append their commands without overwriting one another, but history isn't
fully synchronized live across panes. `pyenv init --no-rehash` avoids a shim scan on every shell start;
run `pyenv rehash` after installing Python tools if shims are missing.

### LazyGit themes

`~/.bashrc` chooses `Library/Application Support/lazygit/dark.yml` or `light.yml` on macOS.
The base LazyGit configuration is compatible with older versions (including 0.65.x);
theme overlays select `delta --dark` / `delta --light` without `{{colorScheme}}`.

## Linux

Install equivalents of `stow`, `tmux`, `xsel` (for X11 clipboard), `ranger`, `fd-find`, `ripgrep`,
`fzf`, `lazygit`, and `git-delta` with your distribution's package manager. Linux keyboard remapping
is deliberately not run on every shell startup; use the appropriate graphical-session startup.

## Xterm

    xrdb ~/.Xresources

## Notes

    Text object copy paste, repeat with .
    yiw
    ciw<C-r>0

## In Karabiner elements

    Devices, swap ISO layout specific keys - ON
    Virtual Keyboard, Keyboard type - ISO
    Complex modifications, add predefined rules

## Keyboard layer:

    Q W E R T Y U I O P
    { } [ ] $ # ? & < >

    A S D F G H J K L Ö Ä
    ; / ( ) | _ ^ ' " ~ `

    Z X C V B N M
    : = @ ! \ % *

### Tab numpad

    Y U I O P   → / 7 8 9
    H J K L ;   → * 4 5 6
    M , . /     → 1 2 3
    Space       → 0
