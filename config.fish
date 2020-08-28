function tmux
	tmux -2
end
function emacs
	XLIB_SKIP_ARGB_VISUALS=1 emacs
end
function walpy
  cat ~/.cache/wal/sequences &
	xset +fp ~/.fonts/misc/
	xset fp+ /usr/share/fonts/bitmap/envypn-font/
	wal -Rq
end
function ls
  command ls --color=auto $argv
end

if status --is-login
	# Import colorscheme from 'wal' asynchronously
	# &   # Run the process in the background.
	# ( ) # Hide shell job control messages.

	# Alternative (blocks terminal for 0-3ms)
	cat ~/.cache/wal/sequences

	# To add support for TTYs this line can be optionally added.
	# source ~/.cache/wal/colors-tty.sh
	set -xg VISUAL 'gvim -f'
	set -xg EDITOR $VISUAL
	set -x TERM xterm-256color
	walpy
end
