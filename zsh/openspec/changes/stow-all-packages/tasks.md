## 1. Pre-flight Checks

- [x] 1.1 Audit `$HOME` for any existing manual symlinks pointing into the repo root (to avoid breaking them)
- [x] 1.2 Diff root-level Doom files (`config.el`, `init.el`, `packages.el`, `custom.el`) against `doom/.config/doom/` counterparts to identify if they are identical or have diverged
- [x] 1.3 Review root-level `config` (SSH fragment) against `ssh/.ssh/config` to confirm content is already covered

## 2. Create New Stow Packages

- [x] 2.1 Create `alacritty/.config/alacritty/` and move `alacritty.yml` into it
- [x] 2.2 Create `bash/` and move `bash_profile` to `bash/.bash_profile`
- [x] 2.3 Create `compton/.config/compton/` and move `compton.conf` into it
- [x] 2.4 Create `fish/.config/fish/` and move `config.fish` into it
- [x] 2.5 Create `i3/.config/i3/` and move `i3.config` to `i3/.config/i3/config`
- [x] 2.6 Create `openbox/.config/openbox/` and move `autostart` into it
- [x] 2.7 Create `scripts/.local/bin/` and move `doble.sh` and `multimon.sh` into it
- [x] 2.8 Create `suckless/` and move `config.h` into it
- [x] 2.9 Create `tint2/.config/tint2/` and move `tint2rc` into it
- [x] 2.10 Create `xorg/` and move `.Xresources`, `.Xresources.def_dark`, `.Xresources.def_light`, and `xinitrc` (as `.xinitrc`) into it

## 3. Fix Existing Broken Package Layouts

- [x] 3.1 Move `sway/config` → `sway/.config/sway/config`
- [x] 3.2 Move `waybar/config` and `waybar/style.css` → `waybar/.config/waybar/`
- [x] 3.3 Move `wofi/config` and `wofi/style.css` → `wofi/.config/wofi/`
- [x] 3.4 Move `wlogout/layout` and `wlogout/style.css` → `wlogout/.config/wlogout/`

## 4. Consolidate Duplicates

- [x] 4.1 Remove root-level Doom files if confirmed identical to `doom/` package; otherwise merge newer content into the package before removing
- [x] 4.2 Remove root-level `config` (SSH fragment) if confirmed covered by `ssh/.ssh/config`
- [x] 4.3 Move `init.vim` into `vim/.config/nvim/init.vim` (for Neovim reference) or `vim/` as appropriate; remove from root
- [x] 4.4 Move `init-standard.el` into `emacs/.config/emacs/init.el` (standard Emacs config) or `emacs/` as appropriate; remove from root
- [x] 4.5 Remove duplicate `hyprpaper.conf` at repo root (confirmed copy of `hypr/.config/hypr/hyprpaper.conf`)

## 5. Verify

- [x] 5.1 Run `stow --simulate <package>` for each new package to confirm no conflicts before symlinking
- [x] 5.2 Confirm no config files remain at repo root (except `README.md`, `.gitignore`, `hyprland_install`)
