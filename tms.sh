#!/usr/bin/env bash

# const var to choose
base_directory="$HOME/"
editor="$EDITOR"
default_tmux_first_window="1"

# select directory and create new session
new_tmux_session()
{
    selected=$(find $base_directory -mindepth 1 -maxdepth 6 -type d | fzf --algo=v2 --prompt="New session: ")
    
    if [ -z "$selected" ]; then
        return 1
    fi
    
    session_name=$(basename "$selected")
    session_path=$selected
    usr_shell=$(echo $SHELL)
    tmux new-session -Ad -s "$session_name" -c "$session_path" "$usr_shell"
    tmux send-keys -t "$session_name:$default_tmux_first_window" "$editor" Enter
    tmux new-window -t "$session_name:" -c "$session_path"
    tmux select-window -t "$session_name:$default_tmux_first_window"
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$session_name"
    else
        tmux attach-session -t "$session_name"
    fi
}

# select current running session and attach to it
attach_tmux_session()
{
    if ! tmux list-sessions &>/dev/null; then
        echo "No tmux sessions running"
        return 1
    fi
    session_name=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="Select session: ")
    
    if [ -z "$session_name" ]; then
        return 1
    fi
    
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$session_name"
    else
        tmux attach-session -t "$session_name"
    fi
}

# select current running session to kill
kill_tmux_session()
{
    if ! tmux list-sessions &>/dev/null; then
        return 1
    fi
    session_name=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="Kill session: ")
    if [ -z "$session_name" ]; then
        return 1
    fi
    tmux kill-session -t "$session_name"
}

# ctrl + b + d interactive way
detach_tmux_session()
{
    if [ ! -n "$TMUX" ]; then
        return 1
    fi
    choice=$(echo -e "YES\nNO\n" | fzf --prompt="Detach from: \"$(tmux display-message -p '#S')\"")
    case $choice in 
        "YES") tmux detach-client ;;
        "NO") return 1;;
        *) return 1;;
    esac
    return 0
}

main()
{
    while true; do
        choice=$(echo -e "NEW\nATTACH\nDETACH\nKILL\nEXIT" | fzf --prompt="tmux session manager: ")
        case $choice in
            "NEW") 
                new_tmux_session
                [ $? -eq 0 ] && break
                ;;
            "ATTACH") 
                attach_tmux_session
                [ $? -eq 0 ] && break
                ;;
            "DETACH")
                detach_tmux_session
                [ $? -eq 0 ] && break
                ;;
            "KILL") 
                kill_tmux_session
                ;;
            "EXIT" | "")
                break
                ;;
            *) 
                break
                ;;
        esac
    done
}

main
