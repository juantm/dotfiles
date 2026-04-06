#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export VISUAL=vim
export EDITOR=$VISUAL

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
	exec startx
  export XDG_SESSION_DESKTOP=openbox
  # export LOGNAME=jetoro
  export XDG_SESSION_TYPE=x11
  [ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
fi
