# .zshenv - Always sourced for all shells
# Environment variables and PATH configuration
# Base PATH - consolidated for performance
export PATH="$HOME/.local/bin:/usr/local/bin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/findutils/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gawk/libexec/gnubin:/usr/local/opt/gnu-getopt/bin:/usr/local/opt/gnu-indent/libexec/gnubin:/Library/Frameworks/Python.framework/Versions/Current/bin:/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/bin:$PATH"
# npm global bin is already covered by /usr/local/bin (Homebrew symlinks)

# XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Application configuration
export K9S_CONFIG_DIR="${XDG_CONFIG_HOME}/k9s"
export VISUAL='nvim -f'
export EDITOR="$VISUAL"
export VAULT_ADDR="https://secret-mgmt.falabella.tech/"
export HTTPLIB2_CA_CERTS=${HOME}/cacerts.txt

# Node js self signed certificate
export NODE_TLS_REJECT_UNAUTHORIZED='0'

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Lazygit - Use multiple config files
export LG_CONFIG_FILE="$HOME/.config/lazygit/lazycommit/config.yml,\
$HOME/.config/lazygit/config.yml"

# Conditional PATH additions
[ -d "${XDG_CONFIG_HOME}/emacs/bin" ] && export PATH="$PATH:${XDG_CONFIG_HOME}/emacs/bin"

# Zinit home directory
export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# macOS specific
if [[ "$(uname)" == "Darwin" ]]; then
    export JIRA_API_USER="jetoro@falabella.cl"
    export LIBRARY_PATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib"
fi
