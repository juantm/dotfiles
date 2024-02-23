PATH=$PATH:$HOME/.local/bin:/usr/local/bin
[ -d "$XDG_CONFIG_HOME/emacs.d/bin" ] && PATH=$PATH:$XDG_CONFIG_HOME/emacs.d/bin
[[ -n "${GOROOT-}" && -d "${GOROOT}/bin" ]] && PATH=$PATH:$GOROOT/bin
export PATH
# JIRA
export JIRA_API_USER="jetoro@falabella.cl"
export JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
