# load zgen
source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh

zgen oh-my-zsh themes/steeef
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/kubectl
zgen oh-my-zsh plugins/command-not-found 
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-completions
zgen load zsh-users/zsh-history-substring-search
# zgen load zsh-users/zsh-autosuggestions

alias tmux='tmux -2'
export VISUAL=gvim
export EDITOR=$VISUAL
export PATH=$PATH:$GOROOT/bin
export TERM=xterm-256color

