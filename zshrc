# load zgen
source "${HOME}/.zgen/zgen.zsh"

  zgen oh-my-zsh

  zgen oh-my-zsh themes/simple
  zgen oh-my-zsh plugins/tmux 
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load zsh-users/zsh-completions
  zgen load zsh-users/zsh-history-substring-search
  zgen load zsh-users/zsh-autosuggestions

  alias tmux='tmux -2'
  export VISUAL=gvim
  export EDITOR=$VISUAL

