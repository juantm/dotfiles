PATH=$PATH:$HOME/.local/bin:/usr/local/bin
XDG_CONFIG_HOME=$HOME/.config
[[ -n "${GOROOT-}" && -d "${GOROOT}/bin" ]] && PATH=$PATH:$GOROOT/bin
[ -d "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc" ] && source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
VISUAL='nvim -f'
EDITOR=$VISUAL

export PATH
alias ll="ls -lhtra --color"

if [[ "$(uname)" == "Darwin" ]]; then
JIRA_API_USER="jetoro@falabella.cl"
JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
export JIRA_API_USER
export JIRA_API_TOKEN
fi

[[ "$(uname)" == "Darwin" ]] && source <(kubectl completion zsh)
autoload -Uz compinit
compinit
[[ "$(uname)" == "Darwin" ]] && source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
[[ "$(uname)" == "Linux" ]] && source '/usr/share/zsh-antidote/antidote.zsh'
#antidote load
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh
