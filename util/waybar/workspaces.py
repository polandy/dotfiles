#!/usr/bin/env python3
"""Waybar custom/wsN module for Hyprland.

Run one instance per workspace: workspaces.py --workspace N
Outputs JSON with CSS class so waybar can style the active workspace.
"""

import argparse
import json
import os
import socket
import subprocess
import sys

PLACEHOLDER = {
    1:  "\uf086",   # comment
    2:  "\uf0e0",   # envelope
    3:  "\uf135",   # rocket
    4:  "\uf269",   # firefox
    5:  "\uf120",   # terminal
    6:  "\uf121",   # repeat
    7:  "\uf030",   # camera
    8:  "\uf135",   # rocket
    9:  "\uf005",   # star
    10: "\uf108",   # desktop
}

APP_ICONS = {
    "alacritty":        "\uf120",      # terminal
    "firefox":          "\U000f0239",  # firefox
    "thunderbird":      "\U000f01ee",  # mail
    "jetbrains-idea":   "\U000f0eb4",  # intellij
    "code":             "\U000f0e28",  # vscode
    "codium":           "\U000f0e28",  # vscode
    "vscodium":         "\U000f0e28",  # vscode
    "steam":            "\U000f0296",  # steam
    "thunar":           "\uf07b",      # folder
    "copyq":            "\U000f0147",  # clipboard
    "pavucontrol":      "\U000f057e",  # volume high
    "blueman-manager":  "\U000f00af",  # bluetooth
    "galculator":       "\uf1ec",      # calculator
    "nextcloud":        "\U000f0178",  # cloud
}

DEFAULT_ICON = "\uf128"  # question mark

TRIGGER_EVENTS = {
    "openwindow",
    "closewindow",
    "movewindow",
    "workspace",
    "focusedmon",
    "activewindow",
    "urgent",
}


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


def build_output(ws: int) -> dict:
    clients = hyprctl(["clients", "-j"])
    active_ws = hyprctl(["activeworkspace", "-j"]).get("id", 1)

    icons: list[str] = []
    for client in clients:
        if client.get("workspace", {}).get("id") == ws:
            icon = app_icon(client.get("class", ""))
            if icon not in icons:
                icons.append(icon)

    is_active = ws == active_ws
    is_empty = len(icons) == 0
    icon_part = PLACEHOLDER[ws] if is_empty else " ".join(icons)
    text = f"{ws} {icon_part}"

    css_class = "active" if is_active else ("empty" if is_empty else "")
    return {"text": text, "class": css_class}


def emit(ws: int) -> None:
    print(json.dumps(build_output(ws)), flush=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--workspace", type=int, required=True)
    args = parser.parse_args()
    ws = args.workspace

    emit(ws)

    sock_path = get_hyprland_socket(".socket2.sock")
    try:
        sock = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
        sock.connect(sock_path)
    except OSError as e:
        print(f"Failed to connect to Hyprland socket: {e}", file=sys.stderr)
        sys.exit(1)

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
                emit(ws)


if __name__ == "__main__":
    main()
