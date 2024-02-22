PATH=$PATH:~/.local/bin
export PATH
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source <(kubectl completion zsh)
JIRA_API_USER="jetoro@falabella.cl"
JIRA_API_TOKEN=$(security find-generic-password -w -s 'jira-api-key'  -a 'jetoro@falabella.cl')
