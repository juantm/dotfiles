# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit
vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

PATH=$PATH:$HOME/.local/bin:/usr/local/bin
PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"
XDG_CONFIG_HOME=$HOME/.config
K9S_CONFIG_DIR=${XDG_CONFIG_HOME}/k9s
[[ -n "${GOROOT-}" && -d "${GOROOT}/bin" ]] && PATH=$PATH:$GOROOT/bin
[ -d "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -d "${XDG_CONFIG_HOME}/emacs/bin" ] && PATH=$PATH:"${XDG_CONFIG_HOME}/emacs/bin" 
VISUAL='nvim -f'
EDITOR=$VISUAL

export XDG_CONFIG_HOME
export K9S_CONFIG_DIR
export PATH
export TERM="xterm-256color"
alias ll="ls -lhtra --color"
[[ "$(uname)" == "Linux" ]] && source '/usr/share/zsh-antidote/antidote.zsh'
if [[ "$(uname)" == "Darwin" ]]; then
[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ] && source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ] && source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
VAULT_ADDR="https://secret-mgmt.falabella.tech/"
export VAULT_ADDR
export KUBECONFIG=~/.kube/config:$(find ~/.kube -type f -iname '*.yaml' | tr '\n' ':')
alias update="brew update && brew upgrade"
source <(kubectl completion zsh)
source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
source $(brew --prefix)/etc/bash_completion.d/az
# JIRA_API_USER="jetoro@falabella.cl"
# JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
# export JIRA_API_USER
# export JIRA_API_TOKEN
fi
#antidote load
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh

# PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'
# RPROMPT='$(kube_ps1)'
# autoload bashcompinit && bashcompinit
autoload -Uz promptinit && promptinit && prompt powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
