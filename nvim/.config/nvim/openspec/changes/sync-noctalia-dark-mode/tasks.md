## 1. System Preparation

- [x] 1.1 Install `neovim-remote` (nvr) via AUR

## 2. Neovim Implementation

- [x] 2.1 Create the `lua/config/noctalia_sync.lua` module to handle JSON parsing and theme switching
- [x] 2.2 Integrate `noctalia_sync.sync()` into the Neovim startup sequence (init.lua or equivalent)
- [x] 2.3 Verify that Neovim switches themes correctly on launch based on `settings.json`

## 3. noctalia Integration

- [x] 3.1 Update `~/.config/noctalia/settings.json` to set the `darkModeChange` hook to `nvr --remote-send ':lua require("noctalia_sync").sync()<CR>'`
- [ ] 3.2 Test the live theme switch by toggling Dark Mode in Noctalia Shel

## 4. Verification

- [ ] 4.1 Ensure no errors are thrown in Neovim when `nvr` sends the command
- [ ] 4.2 Verify theme persistence across Neovim restarts
