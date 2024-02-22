. "$HOME/.cargo/env"
TERM=screen-256color
VISUAL='nvim -f'
EDITOR=$VISUAL
XDG_CONFIG_HOME=$HOME/.config
JIRA_API_USER="jetoro@falabella.cl"
JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
