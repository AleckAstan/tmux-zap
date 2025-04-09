#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux bind-key z run-shell "tmux popup -E -w 90% -h 60% $CURRENT_DIR/scripts/zap.sh"

