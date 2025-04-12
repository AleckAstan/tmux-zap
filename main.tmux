#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEFAULT_KEY="z"
ZAP_KEY=$(tmux show-option -gqv @zap_key)
ZAP_KEY=${ZAP_KEY:-$DEFAULT_KEY}

if [ "$ZAP_KEY" = "$DEFAULT_KEY" ]; then
  tmux unbind-key -T prefix "$DEFAULT_KEY" 2>/dev/null
fi

ZAP_WIDTH=$(tmux show-option -gqv @zap_width)
ZAP_WIDTH=${ZAP_WIDTH:-"90%"}
ZAP_HEIGHT=$(tmux show-option -gqv @zap_height)
ZAP_HEIGHT=${ZAP_HEIGHT:-"60%"}

tmux bind-key "$ZAP_KEY" run-shell "tmux popup -E -w $ZAP_WIDTH -h $ZAP_HEIGHT $CURRENT_DIR/scripts/zap.sh"
