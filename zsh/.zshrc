# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH=$PATH:$HOME/.local/bin:/usr/local/bin
[ -d "$XDG_CONFIG_HOME/emacs.d/bin" ] && PATH=$PATH:$XDG_CONFIG_HOME/emacs.d/bin
[[ -n "${GOROOT-}" && -d "${GOROOT}/bin" ]] && PATH=$PATH:$GOROOT/bin
export PATH
alias ll="ls -lhtra --color"
if [[ "$(uname)" == "Darwin" ]]; then
export JIRA_API_USER="jetoro@falabella.cl"
export JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
fi

autoload -Uz compinit
compinit
[[ "$(uname)" == "Darwin" ]] && source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
[[ "$(uname)" == "Linux" ]] && source '/usr/share/zsh-antidote/antidote.zsh'
#antidote load
antidote bundle <~/.zsh_plugins.txt >~/.zsh_plugins.zsh
source ~/.zsh_plugins.zsh


autoload -Uz promptinit && promptinit && prompt powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
