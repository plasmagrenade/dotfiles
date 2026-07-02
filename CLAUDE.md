# dotfiles

Install script: `fresh.sh` — sets up a new Mac from scratch (Homebrew, symlinks, tooling).

## Structure

```
configs/          mirrors $HOME — everything here gets symlinked to ~
  .config/
    aerospace/
    kitty/
    nvim/         LazyVim config
    sketchybar/
  .vim/
  .zshrc
  .vimrc
  .tmux.conf
  ...
scripts/
  replace.sh      creates the symlinks (see below)
  git.sh
  ssh.sh
Brewfile.common
Brewfile.personal
Brewfile.work
```

## Symlinking (`scripts/replace.sh`)

- Each subdirectory of `configs/.config/` is symlinked as a whole directory to `~/.config/<name>`
- `configs/.vim/` is symlinked as a whole directory to `~/.vim`
- All other top-level files in `configs/` are symlinked individually to `~`
- Existing targets are backed up to `<path>.backup` before being replaced
- Supports `--dry-run` flag

Run it: `bash scripts/replace.sh`

## nvim

LazyVim. Plugins live in `configs/.config/nvim/lua/plugins/`. Key files:
- `python.lua` — basedpyright LSP config, points at `.venv/bin/python` (uv convention)
- `autocmds.lua` — includes `<leader>p` to insert a `pdb.set_trace()` breakpoint

## Conventions

- Python: always use `uv`, venv at `.venv/` in project root
- Editor: nvim
