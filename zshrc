# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load zgen
# git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen"

source "${HOME}/.zgen/zgen.zsh"

zgen oh-my-zsh

# zgen oh-my-zsh themes/steeef
# zgen oh-my-zsh themes/gentoo
zgen load romkatv/powerlevel10k powerlevel10k
# zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/kubectl
zgen oh-my-zsh plugins/command-not-found 
# zgen oh-my-zsh plugins/npm
zgen load zsh-users/zsh-syntax-highlighting
# zgen load zsh-users/zsh-completions
# zgen load zsh-users/zsh-history-substring-search
# zgen load zsh-users/zsh-autosuggestions
# zgen load marzocchi/zsh-notify
zgen oh-my-zsh plugins/bgnotify

alias tmux='tmux -2'
alias emacs='XLIB_SKIP_ARGB_VISUALS=1 emacs'
export VISUAL='nvim -f'
export EDITOR=$VISUAL
[ -d "/Applications/Emacs.app/Contents/MacOS" ] && PATH=$PATH:/Applications/Emacs.app/Contents/MacOS
[ -d "$HOME/.emacs.d/bin" ] && PATH=$PATH:$HOME/.emacs.d/bin
[[ -n "${GOROOT-}" && -d "${GOROOT}/bin" ]] && PATH=$PATH:$GOROOT/bin
PATH=$PATH:$HOME/.local/bin
export PATH
export TERM=screen-256color
export LD_LIBRARY_PATH=/usr/lib/oracle/19.3/client64/lib:$LD_LIBRARY_PATH
export LANG=es_ES.UTF-8
export LC_ALL=$LANG
#if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
#        source /etc/profile.d/vte.sh
#fi

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
# exec startx
#  export XDG_SESSION_DESKTOP=i3
#  # export LOGNAME=jetoro
#  export XDG_SESSION_TYPE=x11
#  [ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null
#fi

# eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"
source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
