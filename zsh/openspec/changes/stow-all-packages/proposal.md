## Why

All dotfiles configurations should be manageable via `stow <package>` from the repo root. Currently, many config files live at the repo root with no stow structure, and some existing packages (e.g., `sway/`, `waybar/`) have files directly at the package root rather than mirroring `$HOME`. This makes it impossible to symlink them with stow without manual intervention.

## What Changes

- Create new stow packages for every unpackaged root-level config file
- Fix existing packages whose internal layout doesn't mirror `$HOME` (`sway/`, `waybar/`, `wofi/`, `wlogout/`)
- Move root-level Doom Emacs files (`config.el`, `init.el`, `packages.el`, `custom.el`) into `doom/` package — or confirm they are duplicates of what's already there
- Move root-level `config` (SSH global settings fragment) — confirm vs. existing `ssh/` package
- Move `init.vim` into the `vim/` package
- Move `init-standard.el` into the `emacs/` package
- Delete or document `hyprpaper.conf` at root (duplicate of `hypr/.config/hypr/hyprpaper.conf`)

## Capabilities

### New Capabilities

- `alacritty-package`: Stow package for `alacritty.yml` → `alacritty/.config/alacritty/alacritty.yml`
- `bash-package`: Stow package for `bash_profile` → `bash/.bash_profile`
- `compton-package`: Stow package for `compton.conf` → `compton/.config/compton/compton.conf`
- `fish-package`: Stow package for `config.fish` → `fish/.config/fish/config.fish`
- `i3-package`: Stow package for `i3.config` → `i3/.config/i3/config`
- `openbox-package`: Stow package for `autostart` → `openbox/.config/openbox/autostart`
- `scripts-package`: Stow package for `doble.sh` and `multimon.sh` → `scripts/.local/bin/`
- `suckless-package`: Stow package for `config.h` (dwm/st) → `suckless/config.h`
- `tint2-package`: Stow package for `tint2rc` → `tint2/.config/tint2/tint2rc`
- `xorg-package`: Stow package for `.Xresources`, `.Xresources.def_dark`, `.Xresources.def_light`, `xinitrc` → `xorg/`
- `stow-package-layout-fix`: Fix `sway/`, `waybar/`, `wofi/`, `wlogout/` to use proper `$HOME`-mirroring layout

### Modified Capabilities

- `doom-package`: Merge root-level Doom Emacs files into existing `doom/` package (or remove if duplicate)
- `ssh-package`: Reconcile root-level `config` fragment with `ssh/.ssh/config`
- `vim-package`: Move `init.vim` into `vim/` package

## Impact

- All package directories will be symlink-safe via `stow <name>` from repo root
- No files deleted without confirmation — duplicates are verified before removal
- `hyprland_install` left as documentation (not a config file, not stow-managed)
- `README.md` stays at root (not stow-managed)
