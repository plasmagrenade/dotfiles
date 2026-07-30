# dotfiles

Covers both macOS and Linux (omarchy/Arch). Mac install script: `fresh.sh` — sets up a new Mac from scratch (Homebrew, symlinks, tooling). Linux setup is `scripts/replace.sh` plus the package lists (see the Linux section).

## Structure

```
configs/          mirrors $HOME — everything here gets symlinked to ~
  .config/
    aerospace/    (mac)
    sketchybar/   (mac)
    hypr/         (linux) Hyprland: bindings, monitors, idle/lock, autostart
    waybar/       (linux)
    walker/       (linux)
    omarchy/      (linux) branding, hooks, themes (current/ and backgrounds/ are runtime, ignored)
    systemd/      (linux) user units + enablement symlinks
    alacritty/ ghostty/ btop/ fastfetch/  (linux)
    kitty/
    mako/
    nvim/         LazyVim config
  .local/
    bin/          custom scripts, symlinked per-file into ~/.local/bin
  .vim/
  .zshrc
  .vimrc
  .tmux.conf
  ...
scripts/
  replace.sh      creates the symlinks (see below)
  export-packages.sh  (linux) regenerates pacman.packages / aur.packages
  git.sh
  ssh.sh
Brewfile.common
Brewfile.personal
Brewfile.work
pacman.packages   (linux) explicitly installed native packages
aur.packages      (linux) explicitly installed AUR packages
```

## Symlinking (`scripts/replace.sh`)

- Each subdirectory of `configs/.config/` is symlinked as a whole directory to `~/.config/<name>`
- `configs/.vim/` is symlinked as a whole directory to `~/.vim`
- Each file in `configs/.local/bin/` is symlinked individually to `~/.local/bin/` (the rest of that directory is unmanaged)
- All other top-level files in `configs/` are symlinked individually to `~`
- Existing targets are backed up to `<path>.backup` before being replaced
- Supports `--dry-run` flag

Run it: `bash scripts/replace.sh`

## Linux (omarchy)

- Restore packages: `sudo pacman -S --needed - < pacman.packages`, then `yay -S --needed - < aur.packages`. Regenerate the lists with `scripts/export-packages.sh`.
- `omarchy refresh <app>` replaces the `~/.config/<app>` symlink with a copy of the defaults. The omarchy `post-update` hook (`configs/.config/omarchy/hooks/post-update`) warns when that happens; diff, merge, and re-run `replace.sh`. The hook also restores the custom hypridle config and Plymouth boot screen.
- `.local/bin/battery-monitor` is omarchy's battery monitor plus notification dismissal on recharge; `omarchy-battery-monitor.service` points at it so omarchy's git tree stays pristine.
- systemd user units are enabled via the tracked `*.target.wants/` symlinks; run `systemctl --user daemon-reload` after changes.

## nvim

LazyVim. Plugins live in `configs/.config/nvim/lua/plugins/`. Key files:
- `python.lua` — basedpyright LSP config, points at `.venv/bin/python` (uv convention)
- `autocmds.lua` — includes `<leader>p` to insert a `pdb.set_trace()` breakpoint

## Conventions

- Python: always use `uv`, venv at `.venv/` in project root
- Editor: nvim
