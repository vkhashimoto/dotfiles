set -g ALTERNATE_EDITOR ""
set -g EDITOR "emacsclient -t -a ''"
set -g VISUAL "emacsclient -c -a emacs"
. /opt/asdf-vm/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

if status is-interactive
   # Commands to run in interactive sessions can go here
   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      /usr/bin/emacs --fg-daemon --eval '(load-file "~/.emacs.d/init.el")'
      exec startx
   end

end

