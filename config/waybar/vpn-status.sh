#!/usr/bin/env bash

wg=0
ts=0

ip link show wg0 2>/dev/null | grep -q "UP" && wg=1
ip link show tailscale0 2>/dev/null | grep -q "UP" && ts=1

if [[ $wg == 1 && $ts == 1 ]]; then
    echo "󰒍 WG+TS"
elif [[ $wg == 1 ]]; then
    echo "󰒍 WG"
elif [[ $ts == 1 ]]; then
    echo "󰒍 TS"
else
    echo ""
fi
