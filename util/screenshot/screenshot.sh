#!/usr/bin/env bash

choice=$(printf "Area → clipboard\nArea → save\nScreen → clipboard\nScreen → save\nWindow → clipboard\nWindow → save" \
    | rofi -dmenu -p "Screenshot")

case "$choice" in
    "Area → clipboard")   grimblast copy area ;;
    "Area → save")        grimblast save area ~/Pictures/$(date +%Y%m%d_%H%M%S).png ;;
    "Screen → clipboard") grimblast copy screen ;;
    "Screen → save")      grimblast save screen ~/Pictures/$(date +%Y%m%d_%H%M%S).png ;;
    "Window → clipboard") grimblast copy active ;;
    "Window → save")      grimblast save active ~/Pictures/$(date +%Y%m%d_%H%M%S).png ;;
esac
