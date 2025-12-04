# Ultra-optimized .zshrc for fastest startup

# Environment variables - set early
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gawk/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="/usr/local/opt/gnu-indent/libexec/gnubin:$PATH"
export PATH="/Library/Frameworks/Python.framework/Versions/3.12/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export K9S_CONFIG_DIR="${XDG_CONFIG_HOME}/k9s"
export VISUAL='nvim -f'
export EDITOR="$VISUAL"
export VAULT_ADDR="https://secret-mgmt.falabella.tech/"
export HTTPLIB2_CA_CERTS=${HOME}/cacerts.txt
# LAZYGIT - Use multiple config files
export LG_CONFIG_FILE="$HOME/.config/lazygit/lazycommit/config.yml,\
$HOME/.config/lazygit/config.yml"
# Conditional PATH additions
[ -d "${XDG_CONFIG_HOME}/emacs/bin" ] && export PATH="$PATH:${XDG_CONFIG_HOME}/emacs/bin"

# macOS specific
if [[ "$(uname)" == "Darwin" ]]; then
  export JIRA_API_USER="jetoro@falabella.cl"
  export LIBRARY_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
  
  # Lazy load brew shellenv and JIRA token
  _lazy_brew_init() {
    if command -v brew >/dev/null 2>&1; then
      eval "$(brew shellenv)"
    fi
  }
  
  _lazy_jira_token() {
    if command -v security >/dev/null 2>&1; then
      export JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key' -a 'jetoro@falabella.cl' 2>/dev/null)
    fi
  }
  alias update='brew update && brew upgrade && brew cleanup'
fi

# Lazy initialization functions
_lazy_pyenv_init() {
  if [[ -d "$HOME/.pyenv" ]]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
  fi
}

_lazy_kubectl_config() {
  export KUBECONFIG=~/.kube/config:$(find ~/.kube -type f -iname '*.yaml' 2>/dev/null | tr '\n' ':')
}

# Set the directory we want to store zinit and plugins
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

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

# Replace Oh My Zsh snippets with minimal implementations
# Git aliases (instead of OMZP::git)
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gapt='git apply --3way'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|$(git_develop_branch))\s*$)" | command xargs -n 1 git branch -d'

alias gc='git commit -v'
alias gcam='git commit -a -m'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gca='git commit -v -a'

alias gco='git checkout'
alias gcb='git checkout -b'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout $(git_develop_branch)'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gl='git pull'
alias ggl='git pull origin $(git_current_branch)'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase $(git_develop_branch)'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbs='git rebase --skip'

alias grh='git reset'
alias grhh='git reset --hard'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grm='git rm'
alias grmc='git rm --cached'

alias gss='git status -s'
alias gst='git status'

alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'

# Git helper functions
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function git_main_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local ref
  for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
    if command git show-ref -q --verify $ref; then
      echo ${ref:t}
      return
    fi
  done
  echo master
}

function git_develop_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in dev devel development; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo develop
}

# Load only the most essential OMZ snippets with maximum delay
zinit ice wait"3" lucid
zinit snippet OMZP::sudo

# Minimal completion initialization - skip security checks for speed
autoload -Uz compinit
compinit -C

# Zinit completion replay
zinit cdreplay -q

# Essential keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History configuration
export HISTSIZE=5000
export HISTFILE=~/.zsh_history
export SAVEHIST=$HISTSIZE
export HISTDUP=erase
setopt appendhistory sharehistory hist_ignore_space hist_ignore_all_dups
setopt hist_save_no_dups hist_ignore_dups hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Essential aliases
alias ll='ls -l --color'
alias vim='nvim'
alias c='clear'

# Lazy load functions for expensive operations
pyenv() {
  unfunction pyenv
  _lazy_pyenv_init
  pyenv "$@"
}

kubectl() {
  unfunction kubectl
  _lazy_kubectl_config
  command kubectl "$@"
}

# Load shell integrations very late
_load_shell_integrations() {
  # Load fzf integration
  if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --zsh)"
  fi
  
  # Load zoxide integration
  if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init --cmd cd zsh)"
  fi
  
  # Load iterm2 integration if present
  [[ -f "${HOME}/.iterm2_shell_integration.zsh" ]] && source "${HOME}/.iterm2_shell_integration.zsh"
  
  # Load additional OMZ snippets only when needed
  zinit ice wait"5" lucid; zinit snippet OMZP::brew
  zinit ice wait"5" lucid; zinit snippet OMZP::gcloud
  zinit ice wait"5" lucid; zinit snippet OMZP::pyenv
  zinit ice wait"5" lucid; zinit snippet OMZP::kubectl
  zinit ice wait"5" lucid; zinit snippet OMZP::kubectx
  zinit ice wait"5" lucid; zinit snippet OMZP::command-not-found
}

# Load integrations in background after a delay
autoload -Uz add-zsh-hook
add-zsh-hook precmd _load_shell_integrations_once

_load_shell_integrations_once() {
  add-zsh-hook -d precmd _load_shell_integrations_once
  # Run in background to not block prompt
  (sleep 2 && _load_shell_integrations) &
}

# Initialize brew and jira token on first use if on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  brew() {
    unfunction brew
    _lazy_brew_init
    command brew "$@"
  }
  
  jira() {
    _lazy_jira_token
    command jira "$@"
  }
fi
alias emacs-gui="/usr/local/opt/emacs-plus@30/bin/emacs"
export DD_APP_KEY=1445899ab946f5ebb24ff19538853ad6af622648
export DD_API_KEY=a009cec817d50f5a960ffd00645c453f
