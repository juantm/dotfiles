## MODIFIED Requirements

### Requirement: vim package contains init.vim
The `vim/` stow package SHALL contain `init.vim` at `vim/.config/nvim/init.vim` (for Neovim) or documented as a reference file, since `.vimrc` already exists in the package. The root-level `init.vim` SHALL be removed after being placed in the correct package location.

#### Scenario: no init.vim remains at repo root
- **WHEN** the vim package consolidation is complete
- **THEN** `init.vim` does not exist at the repo root
