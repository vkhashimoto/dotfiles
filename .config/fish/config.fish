if status is-interactive
   # Commands to run in interactive sessions can go here
   set -g ALTERNATE_EDITOR ""
   set -g EDITOR "emacsclient -t -a ''"
   set -g VISUAL "emacsclient -c -a emacs"
   if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
      exec startx
   end
   . /opt/asdf-vm/asdf.fish
   . ~/.asdf/plugins/java/set-java-home.fish

end

