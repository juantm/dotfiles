# OPENSPEC:START
# OpenSpec shell completions configuration (compinit is called below with daily-cache optimization)
fpath=("/Users/jetoro/.zsh/completions" $fpath)
# OPENSPEC:END

# .zshrc - Sourced for interactive shells
# Plugins, aliases, keybindings, completion, and history

# Aliases
alias ll="ls -lahG"

# macOS specific aliases
if [[ "$(uname)" == "Darwin" ]]; then
  alias update='brew update && brew upgrade && brew cleanup'
fi

# Lazy initialization functions
_lazy_pyenv_init() {
  eval "$(pyenv init - zsh)"
  eval "$(pyenv virtualenv-init - zsh)"
}

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Only essential plugins that load instantly
zinit ice wait"0a" lucid blockf
zinit light zsh-users/zsh-completions

zinit ice wait"0b" lucid
zinit light zsh-users/zsh-syntax-highlighting

zinit ice wait"0c" lucid atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions

# Load fzf-tab with delay
zinit ice wait"1" lucid
zinit light Aloxaf/fzf-tab


# Load only the most essential OMZ snippets with maximum delay
zinit ice wait"3" lucid
zinit snippet OMZP::sudo

# Optimized completion initialization - only rebuild cache once per day
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit -d ~/.zcompdump
else
  compinit -C -d ~/.zcompdump
fi

# Zinit completion replay
zinit cdreplay -q

# Prompt initialization
autoload -Uz promptinit
promptinit
#prompt redhat
# Load pure theme
zinit ice pick"async.zsh" src"pure.zsh" # with zsh-async library that's bundled with it.
zinit light sindresorhus/pure

# Colors and hooks
autoload -Uz colors && colors
autoload -Uz add-zsh-hook

# Essential keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History configuration
HISTSIZE=10000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_SPACE HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS HIST_IGNORE_DUPS HIST_FIND_NO_DUPS HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY

# Shell integration cache — avoids re-forking fzf/zoxide on every shell start
mkdir -p ~/.cache/zsh

# fzf integration (cached, regenerated when binary changes)
_fzf_cache=~/.cache/zsh/fzf-init.zsh
if command -v fzf >/dev/null 2>&1; then
  if [[ ! -f $_fzf_cache || $(command -v fzf) -nt $_fzf_cache ]]; then
    fzf --zsh >| $_fzf_cache
  fi
  source $_fzf_cache
fi
unset _fzf_cache

# zoxide integration (cached, regenerated when binary changes)
_zoxide_cache=~/.cache/zsh/zoxide-init.zsh
if command -v zoxide >/dev/null 2>&1; then
  if [[ ! -f $_zoxide_cache || $(command -v zoxide) -nt $_zoxide_cache ]]; then
    zoxide init --cmd cd zsh >| $_zoxide_cache
  fi
  source $_zoxide_cache
fi
unset _zoxide_cache

# OMZ snippets — deferred into the interactive shell via zinit wait (not a background subshell)
zinit ice wait"2" lucid; zinit snippet OMZP::brew
zinit ice wait"2" lucid; zinit snippet OMZP::gcloud
zinit ice wait"2" lucid; zinit snippet OMZP::pyenv
zinit ice wait"2" lucid; zinit snippet OMZP::kubectl
zinit ice wait"2" lucid; zinit snippet OMZP::kubectx
zinit ice wait"2" lucid; zinit snippet OMZP::command-not-found

# iterm2 shell integration (deferred, only in iTerm2)
if [[ -f "${HOME}/.iterm2_shell_integration.zsh" && "$TERM_PROGRAM" == "iTerm.app" ]]; then
  zinit ice wait"2" lucid
  zinit snippet "${HOME}/.iterm2_shell_integration.zsh"
fi

export PATH="$PATH:./node_modules/.bin"
