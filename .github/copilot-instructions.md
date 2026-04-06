# Copilot Instructions

## Repository Overview

Personal dotfiles repository. Configurations are managed with **GNU Stow** — each top-level directory is a stow package that mirrors the home directory structure.

## GNU Stow Package Convention

Top-level directories (e.g., `wezterm/`, `tmux/`, `doom/`, `hypr/`) are stow packages. Their internal structure mirrors `$HOME`:

```
tmux/.config/tmux/tmux.conf  →  ~/.config/tmux/tmux.conf
wezterm/.wezterm.lua          →  ~/.wezterm.lua
doom/.config/doom/config.el   →  ~/.config/doom/config.el
```

To symlink a package: `stow <package-name>` (run from repo root).

Root-level files (e.g., `alacritty.yml`, `i3.config`, `init.el`) are legacy flat configs not managed by stow.

## OpenSpec Workflow

Changes to this repo are managed using the [OpenSpec](https://openspec.dev) CLI (`openspec` v1.2.0). The workflow lives in `zsh/openspec/` and is configured via `zsh/openspec/config.yaml`.

### Slash Commands (in Copilot Chat)

| Command | Purpose |
|---|---|
| `/opsx:propose` | Propose a new change — generates `proposal.md`, `design.md`, `tasks.md` |
| `/opsx:apply [name]` | Implement tasks from a change |
| `/opsx:archive [name]` | Archive a completed change |
| `/opsx:explore` | Enter explore/thinking mode (no implementation) |

### CLI Commands

```bash
openspec list --json                          # list active changes
openspec new change "<name>"                  # scaffold a new change
openspec status --change "<name>" --json      # check artifact status
openspec instructions <artifact> --change "<name>" --json  # get instructions for an artifact
```

### Change Structure

```
zsh/openspec/changes/<name>/
  .openspec.yaml
  proposal.md
  design.md
  tasks.md
  specs/          # delta specs (merged to openspec/specs/ on archive)
zsh/openspec/changes/archive/YYYY-MM-DD-<name>/
zsh/openspec/specs/                           # main spec files
```

Tasks use `- [ ]` / `- [x]` checkboxes. Mark complete after each task is implemented.
