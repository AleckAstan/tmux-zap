#!/usr/bin/env bash

set -g @tmux_zap_key "z"
set -g @tmux_zap_width "90%"
set -g @tmux_zap_height "60%"

bind-key -n "#{@tmux_zap_key}" \
  run-shell -E \
  -w "#{@tmux_zap_width}" \
  -h "#{@tmux_zap_height}" \
  "#{@plugin-root}/scripts/zap.sh"
