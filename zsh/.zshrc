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
[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ] && source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
[ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ] && source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
VISUAL='nvim -f'
EDITOR=$VISUAL
VAULT_ADDR="https://secret-mgmt.falabella.tech/"

export KUBECONFIG=~/.kube/config:$(find ~/.kube -type f -iname '*.yaml' | tr '\n' ':')
export XDG_CONFIG_HOME
export K9S_CONFIG_DIR
export VAULT_ADDR
export PATH
alias ll="ls -lhtra --color"
alias update="brew update && brew upgrade"
if [[ "$(uname)" == "Darwin" ]]; then
# JIRA_API_USER="jetoro@falabella.cl"
# JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
# export JIRA_API_USER
# export JIRA_API_TOKEN
fi

[[ "$(uname)" == "Darwin" ]] && source <(kubectl completion zsh)
[[ "$(uname)" == "Darwin" ]] && source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
[[ "$(uname)" == "Linux" ]] && source '/usr/share/zsh-antidote/antidote.zsh'
#antidote load
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh

PROMPT='$(kube_ps1)'$PROMPT # or RPROMPT='$(kube_ps1)'
# RPROMPT='$(kube_ps1)'
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az
