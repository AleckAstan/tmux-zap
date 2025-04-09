#!/usr/bin/env bash
[ -z "$TMUX_ZAP_KEY" ] && TMUX_ZAP_KEY="z"

tmux bind-key "$TMUX_FZF_LAUNCH_KEY" run-shell -b -w "90%" -h "60%" "#{@plugin-root}/scripts/zap.sh"
