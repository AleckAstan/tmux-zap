#!/usr/bin/env bash
REQUIRED_TMUX_VERSION="3.2"

version_ge() {
  [ "$(printf '%s\n' "$2" "$1" | sort -V | head -n1)" = "$2" ]
}

if ! command -v fzf &> /dev/null; then
  echo "Error: fzf is not installed. Please install fzf first."
  exit 1
fi

if ! command -v tmux &> /dev/null; then
  echo "Error: tmux is not installed. Please install tmux first."
  exit 1
fi

CURRENT_TMUX_VERSION=$(tmux -V | awk '{print $2}')
if ! version_ge "$CURRENT_TMUX_VERSION" "$REQUIRED_TMUX_VERSION"; then
  echo "Error: tmux $REQUIRED_TMUX_VERSION or higher is required. You have tmux $CURRENT_TMUX_VERSION."
  exit 1
fi

tmux list-windows -a -F '#{session_name}:#{window_index}:#{window_name}' |
fzf --prompt='Zap to window: ' \
    --reverse \
| cut -d':' -f1,2 |
while IFS=':' read -r session window; do
  tmux switch-client -t "$session"
  tmux select-window -t "${session}:$window"
done
