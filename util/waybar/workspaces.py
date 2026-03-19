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
from pathlib import Path

sys.path.insert(0, str(Path(__file__).parent))
from icons import APP_ICONS, APP_DEFAULT, WORKSPACE_PLACEHOLDERS as PLACEHOLDER

DEFAULT_ICON = APP_DEFAULT

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
