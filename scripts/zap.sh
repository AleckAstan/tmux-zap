#!/usr/bin/env bash
tmux list-windows -a -F '#{session_name}:#{window_index}:#{window_name}' |
fzf --prompt='Zap to window: ' \
    --reverse \
| cut -d':' -f1,2 |
while IFS=':' read -r session window; do
  tmux switch-client -t "$session"
  tmux select-window -t "${session}:$window"
done
