#!/usr/bin/fish

function startup
    if not test (pidof $argv[1])
        echo "Starting $argv[1]"
        nohup $argv
    end
end


startup alacritty -e ~/dotfiles/scripts/tmux_startup.fish
startup firefox 
startup telegram-desktop &
startup xfce4-clipman 

