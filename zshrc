# load zgen
# git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh

# zgen oh-my-zsh themes/steeef
zgen oh-my-zsh themes/gentoo
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/kubectl
zgen oh-my-zsh plugins/command-not-found 
zgen oh-my-zsh plugins/npm
zgen load zsh-users/zsh-syntax-highlighting
#zgen load zsh-users/zsh-completions
zgen load zsh-users/zsh-history-substring-search
# zgen load zsh-users/zsh-autosuggestions
# zgen load marzocchi/zsh-notify
zgen oh-my-zsh plugins/bgnotify

alias tmux='tmux -2'
alias emacs='XLIB_SKIP_ARGB_VISUALS=1 emacs'
export VISUAL='gvim -f'
export EDITOR=$VISUAL
export PATH=$PATH:$GOROOT/bin:$HOME/.local/bin
export TERM=xterm-256color
export LD_LIBRARY_PATH=/usr/lib/oracle/19.3/client64/lib:$LD_LIBRARY_PATH

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
 exec startx
  export XDG_SESSION_DESKTOP=i3
  # export LOGNAME=jetoro
  export XDG_SESSION_TYPE=x11
  [ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
fi
