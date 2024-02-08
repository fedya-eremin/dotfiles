#!/usr/bin/env fish

set session_name = $(tmux list-sessions |\
awk '{print $1,$2,$3}' |\
fzf-tmux -p --color=prompt:#bf7763 --prompt "> session: " |\
awk '{print $1}')
if test "$session_name" != "="
    # this goofy ahh     v move is working especially under `tmux run-shell`
    tmux switch-client -t$session_name
end
