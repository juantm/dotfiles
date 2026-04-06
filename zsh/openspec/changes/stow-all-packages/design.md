## Context

The `.dotfiles` repo uses GNU Stow for symlink management. A valid stow package must mirror `$HOME` internally — `stow <pkg>` from the repo root symlinks each file relative to its position inside the package directory into `$HOME`. Currently ~24 files live at the repo root with no package, and several existing packages (`sway/`, `waybar/`, `wofi/`, `wlogout/`) have their configs directly at the package root, making them non-functional with stow.

## Goals / Non-Goals

**Goals:**
- Every config file lives inside a properly structured stow package
- `stow <name>` from the repo root correctly symlinks files to `$HOME`
- No data loss — duplicates are resolved by keeping the more complete version

**Non-Goals:**
- Changing any config file content
- Unifying packages (each tool keeps its own package)
- Managing `hyprland_install` (notes/install script, not a config)
- Stow-managing `README.md` or `.gitignore`

## Decisions

**XDG vs dotfile path per package**

New packages follow the same convention used by existing well-structured packages (`foot/`, `tmux/`, `k9s/`): files go under `.config/<tool>/` inside the package when the tool supports XDG, and directly at package root for dotfiles (e.g., `bash/.bash_profile`, `vim/.vimrc`).

| Root file | Target package path | Rationale |
|---|---|---|
| `alacritty.yml` | `alacritty/.config/alacritty/alacritty.yml` | Alacritty supports XDG |
| `bash_profile` | `bash/.bash_profile` | Bash uses `~/.bash_profile` |
| `compton.conf` | `compton/.config/compton/compton.conf` | XDG path |
| `config` (SSH fragment) | Merge into `ssh/.ssh/config` → remove | Fragment already covered by main SSH config |
| `config.el` | Verify vs `doom/.config/doom/config.el` → remove if identical | Root file predates `doom/` package |
| `config.fish` | `fish/.config/fish/config.fish` | Fish uses XDG |
| `config.h` | `suckless/config.h` | Suckless tools compile from source; no XDG |
| `custom.el` | Verify vs `doom/.config/doom/custom.el` → remove if identical | Same as above |
| `doble.sh`, `multimon.sh` | `scripts/.local/bin/doble.sh` etc. | Scripts go in user bin |
| `hyprpaper.conf` | Remove (duplicate of `hypr/.config/hypr/hyprpaper.conf`) | Exact duplicate |
| `i3.config` | `i3/.config/i3/config` | i3 uses XDG |
| `init.el` | Verify vs `doom/.config/doom/init.el` → remove if identical | Same as above |
| `init-standard.el` | `emacs/.config/emacs/init.el` | Standard Emacs config |
| `init.vim` | `vim/.vim/vimrc` or `nvim/.config/nvim/init.vim` | Check if nvim package exists |
| `packages.el` | Verify vs `doom/.config/doom/packages.el` → remove if identical | Same as above |
| `tint2rc` | `tint2/.config/tint2/tint2rc` | XDG path |
| `xinitrc`, `.Xresources*` | `xorg/.xinitrc`, `xorg/.Xresources` etc. | X11 dotfiles at home root |
| `autostart` | `openbox/.config/openbox/autostart` | openbox autostart |

**Fixing broken packages (sway, waybar, wofi, wlogout)**

These packages have files at `<pkg>/config` instead of `<pkg>/.config/<tool>/config`. They need to be moved to the correct XDG path inside the package. Since no symlinks currently exist for these (can't work with stow as-is), there is no symlink to update.

**Alternatives considered:** Moving `suckless/config.h` to `~/.config/suckless/config.h` — rejected because suckless tools require the file at their source directory at compile time, not a runtime config path.

## Risks / Trade-offs

- **Existing manual symlinks** → If any root-level files are already manually symlinked into `$HOME`, moving them will break those links. Mitigation: check `ls -la $HOME` for any such links before deleting.
- **Doom Emacs duplicates** → Root-level Doom files may have diverged from `doom/` package. Mitigation: diff before removing; keep the more recent version.
- **`sway/config` layout change** → After restructuring, running `stow sway` will attempt to create `~/.config/sway/config`. If a file already exists there (manual), it will conflict. Mitigation: check first.

## Migration Plan

1. Audit any existing manual symlinks from `$HOME` pointing into the repo root
2. Create new stow packages for unpackaged root-level files
3. Merge/verify then remove duplicate Doom Emacs files at root
4. Fix broken package layouts (`sway`, `waybar`, `wofi`, `wlogout`)
5. Delete `hyprpaper.conf` at root (confirmed duplicate)
6. Run `stow <name>` for each new/fixed package to verify no conflicts
