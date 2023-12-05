#!/usr/bin/fish

systemctl --user start tmux
tmux start-server
tmux run ~/.config/tmux/plugins/tmux-resurrect/scripts/restore.sh
tmux a

