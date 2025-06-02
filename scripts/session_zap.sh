tmux list-sessions -F '#{session_name}' |
fzf --prompt='Zap to session: ' \
    --reverse \
| cut -d':' -f1,2 |
while IFS=':' read -r session; do
  tmux switch-client -t "$session"
done
