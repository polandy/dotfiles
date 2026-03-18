#!/usr/bin/env python3
"""Waybar custom/workspaces module for Hyprland.

Shows placeholder icons for empty workspaces and app icons for occupied ones.
Active workspace is highlighted in green; empty workspaces are dimmed.
"""

import json
import os
import socket
import subprocess
import sys

WORKSPACES = list(range(1, 11))

PLACEHOLDER = {
    1:  "\uf086",   # comment (original ws1)
    2:  "\uf0e0",   # envelope (original ws2)
    3:  "\uf135",   # rocket (original ws3)
    4:  "\uf269",   # firefox (original ws4)
    5:  "\uf120",   # terminal (original ws5)
    6:  "\uf121",   # repeat (original ws6)
    7:  "\uf030",   # camera (original ws7)
    8:  "\uf135",   # rocket (original ws8)
    9:  "\uf005",   # star (original ws9)
    10: "\uf108",   # desktop (original ws10)
}

APP_ICONS = {
    "alacritty":        "\uf120",   # terminal
    "firefox":          "\U000f0239",  # firefox
    "thunderbird":      "\U000f01ee",  # mail
    "jetbrains-idea":   "\U000f0eb4",  # intellij
    "code":             "\U000f0e28",  # vscode
    "codium":           "\U000f0e28",  # vscode
    "vscodium":         "\U000f0e28",  # vscode
    "steam":            "\U000f0296",  # steam
    "thunar":           "\uf07b",   # folder
    "copyq":            "\U000f0147",  # clipboard
    "pavucontrol":      "\U000f057e",  # volume high
    "blueman-manager":  "\U000f00af",  # bluetooth
    "galculator":       "\uf1ec",   # calculator
    "nextcloud":        "\U000f0178",  # cloud
}

DEFAULT_ICON = "\uf128"  # question mark

# Colors (Catppuccin Macchiato)
COLOR_ACTIVE    = "#a6da95"  # green
COLOR_NORMAL    = "#939ab7"  # grey
COLOR_DIM       = "#555870"  # dimmed grey (approx 50% of grey)
COLOR_BG_ACTIVE = "#494d64"  # bg2 (Catppuccin Macchiato)


def get_hyprland_socket(socket_name: str) -> str:
    sig = os.environ.get("HYPRLAND_INSTANCE_SIGNATURE")
    if not sig:
        hypr_dir = "/tmp/hypr"
        try:
            entries = sorted(os.listdir(hypr_dir))
            if entries:
                sig = entries[-1]
        except OSError:
            pass
    runtime = os.environ.get("XDG_RUNTIME_DIR", f"/run/user/{os.getuid()}")
    return f"{runtime}/hypr/{sig}/{socket_name}"


def hyprctl(cmd: list[str]) -> list | dict:
    result = subprocess.run(["hyprctl"] + cmd, capture_output=True, text=True)
    return json.loads(result.stdout)


def app_icon(class_name: str) -> str:
    key = class_name.lower()
    for k, icon in APP_ICONS.items():
        if k in key:
            return icon
    return DEFAULT_ICON


def build_output() -> str:
    clients = hyprctl(["clients", "-j"])
    active_ws_data = hyprctl(["activeworkspace", "-j"])
    active_ws = active_ws_data.get("id", 1)

    # Map workspace id → set of app icons
    ws_icons: dict[int, list[str]] = {}
    for ws in WORKSPACES:
        ws_icons[ws] = []

    for client in clients:
        ws_id = client.get("workspace", {}).get("id")
        if ws_id in ws_icons:
            icon = app_icon(client.get("class", ""))
            if icon not in ws_icons[ws_id]:
                ws_icons[ws_id].append(icon)

    parts = []
    for ws in WORKSPACES:
        icons = ws_icons[ws]
        is_active = ws == active_ws
        is_empty = len(icons) == 0

        if is_active:
            color = COLOR_ACTIVE
        elif is_empty:
            color = COLOR_DIM
        else:
            color = COLOR_NORMAL

        if is_empty:
            icon_part = PLACEHOLDER[ws]
        else:
            icon_part = " ".join(icons)

        display = f'{ws} {icon_part}'
        if is_active:
            parts.append(f'<span color="{color}" background="{COLOR_BG_ACTIVE}"> {display} </span>')
        else:
            parts.append(f'<span color="{color}">{display}</span>')

    text = "  ".join(parts)
    return text


def emit() -> None:
    text = build_output()
    print(json.dumps({"text": text, "tooltip": "workspaces"}), flush=True)


def main() -> None:
    emit()

    sock_path = get_hyprland_socket(".socket2.sock")
    try:
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(sock_path)
    except OSError as e:
        print(f"Failed to connect to Hyprland socket: {e}", file=sys.stderr)
        sys.exit(1)

    TRIGGER_EVENTS = {
        "openwindow",
        "closewindow",
        "movewindow",
        "workspace",
        "focusedmon",
        "activewindow",
        "urgent",
    }

    buf = ""
    while True:
        chunk = sock.recv(4096).decode("utf-8", errors="replace")
        if not chunk:
            break
        buf += chunk
        while "\n" in buf:
            line, buf = buf.split("\n", 1)
            event = line.split(">>", 1)[0]
            if event in TRIGGER_EVENTS:
                emit()


if __name__ == "__main__":
    main()
