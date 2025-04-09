#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ZAP_KEY=$(tmux show-option -gqv @zap_key)
ZAP_KEY=${ZAP_KEY:-"z"}

tmux bind-key "$ZAP_KEY" run-shell "tmux popup -E -w 90% -h 60% $CURRENT_DIR/scripts/zap.sh"

