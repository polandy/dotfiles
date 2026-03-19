#!/usr/bin/env bash
HOST=$(hostname -s)
CONFIG="$HOME/.config/waybar/config.hyprland"
STYLE="$HOME/.config/waybar/style.css"
HOST_CONFIG="$HOME/.config/waybar/config.${HOST}.hyprland"
HOST_STYLE="$HOME/.config/waybar/style.${HOST}.css"
if [ -f "$HOST_CONFIG" ]; then
    TMPCONFIG=$(mktemp /tmp/waybar-config-XXXXXX.json)
    jq -s '.[0] * .[1]' "$CONFIG" "$HOST_CONFIG" > "$TMPCONFIG"
    CONFIG="$TMPCONFIG"
fi
[ -f "$HOST_STYLE" ] && STYLE="$HOST_STYLE"
waybar --config "$CONFIG" --style "$STYLE" 2>&1 | tee -a /tmp/waybar.log &
disown
