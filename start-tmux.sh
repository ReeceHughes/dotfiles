#!/bin/bash

tmux new-session -d -s Dev -n dev1
tmux send-keys -t Dev:dev1 "cd ~/development; clear" Enter

tmux new-window -n dev2
tmux send-keys -t Dev:dev2 "cd ~/development; clear" Enter

tmux new-window
tmux new-window

tmux attach -t Dev:dev1

