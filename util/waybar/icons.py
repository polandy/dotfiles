# Nerd Font / FontAwesome icon definitions
# Used by waybar scripts for consistent icon mapping.
#
# FontAwesome (FA) range:  U+F000–U+F2FF  (fa-*)
# Nerd Font MDI range:     U+F0000–U+FFFFF (nf-md-*)

# ── Workspace placeholders ────────────────────────────────────────────────────

WS_1  = "\uf086"   # fa-comment
WS_2  = "\uf0e0"   # fa-envelope
WS_3  = "\uf135"   # fa-rocket
WS_4  = "\uf269"   # fa-firefox
WS_5  = "\uf120"   # fa-terminal
WS_6  = "\uf121"   # fa-repeat
WS_7  = "\uf030"   # fa-camera
WS_8  = "\uf135"   # fa-rocket
WS_9  = "\uf005"   # fa-star
WS_10 = "\uf108"   # fa-desktop

WORKSPACE_PLACEHOLDERS = {
    1: WS_1,
    2: WS_2,
    3: WS_3,
    4: WS_4,
    5: WS_5,
    6: WS_6,
    7: WS_7,
    8: WS_8,
    9: WS_9,
    10: WS_10,
}

# ── App icons ─────────────────────────────────────────────────────────────────

APP_TERMINAL     = "\uf120"      # fa-terminal          (alacritty, kitty, …)
APP_FILES        = "\uf07b"      # fa-folder-open       (thunar, nautilus)
APP_FIREFOX      = "\uf269"      # fa-firefox
APP_CHROME       = "\uf268"      # fa-chrome
APP_VSCODE       = "\uf1c9"      # fa-file-code-o       (vscode, vscodium)
APP_INTELLIJ     = "\ue7b5"      # nf-dev-java          (jetbrains-idea)
APP_MAIL         = "\uf0e0"      # fa-envelope          (thunderbird)
APP_STEAM        = "\uf1b6"      # fa-steam
APP_CLIPBOARD    = "\uf0c5"      # fa-files-o           (copyq)
APP_VOLUME       = "\uf028"      # fa-volume-up         (pavucontrol)
APP_BLUETOOTH    = "\uf293"      # fa-bluetooth         (blueman-manager)
APP_CALCULATOR   = "\uf1ec"      # fa-calculator        (galculator)
APP_CLOUD        = "\uf0c2"      # fa-cloud             (nextcloud)
APP_CAMERA       = "\uf030"      # fa-camera            (digikam)
APP_CAMERA_RETRO = "\uf083"      # fa-camera-retro      (darktable)
APP_BANK         = "\uf19c"      # fa-bank              (homebank)
APP_DEFAULT      = "\uf128"      # fa-question-circle

APP_ICONS = {
    "alacritty":        APP_TERMINAL,
    "firefox":          APP_FIREFOX,
    "chrome":           APP_CHROME,
    "chromium":         APP_CHROME,
    "thunderbird":      APP_MAIL,
    "jetbrains-idea":   APP_INTELLIJ,
    "code":             APP_VSCODE,
    "codium":           APP_VSCODE,
    "vscodium":         APP_VSCODE,
    "steam":            APP_STEAM,
    "thunar":           APP_FILES,
    "copyq":            APP_CLIPBOARD,
    "pavucontrol":      APP_VOLUME,
    "blueman-manager":  APP_BLUETOOTH,
    "galculator":       APP_CALCULATOR,
    "nextcloud":        APP_CLOUD,
    "digikam":          APP_CAMERA,
    "darktable":        APP_CAMERA_RETRO,
    "homebank":         APP_BANK,
}

# ── System / status bar ───────────────────────────────────────────────────────

CPU              = "\U000f0ee0"  # nf-md-cpu_64_bit
RAM              = "\U000f035b"  # nf-md-memory
DISK             = "\U000f02ca"  # nf-md-harddisk
CLOCK            = "\U000f0954"  # nf-md-clock_outline
CALENDAR         = "\uf073"      # fa-calendar

# ── Network ───────────────────────────────────────────────────────────────────

NET_WIFI_FULL    = "\U000f092f"  # nf-md-wifi_strength_4
NET_WIFI_MED     = "\U000f092b"  # nf-md-wifi_strength_2
NET_WIFI_LOW     = "\U000f0922"  # nf-md-wifi_strength_1
NET_ETHERNET     = "\U000f0200"  # nf-md-ethernet
NET_DISCONNECTED = "\U000f092e"  # nf-md-wifi_strength_off_outline
VPN_ON           = "\U000f0582"  # nf-md-shield_lock
VPN_OFF          = "\U000f0584"  # nf-md-shield_off

# ── Volume ────────────────────────────────────────────────────────────────────

VOLUME_HIGH      = "\U000f057e"  # nf-md-volume_high
VOLUME_MED       = "\U000f0580"  # nf-md-volume_medium
VOLUME_LOW       = "\U000f057f"  # nf-md-volume_low
VOLUME_MUTE      = "\U000f0581"  # nf-md-volume_off
VOLUME_HEADPHONE = "\U000f02cb"  # nf-md-headphones
VOLUME_HEADSET   = "\U000f02cc"  # nf-md-headset

# ── Battery ───────────────────────────────────────────────────────────────────

BATTERY_FULL     = "\U000f0079"  # nf-md-battery
BATTERY_75       = "\U000f007a"  # nf-md-battery_70
BATTERY_50       = "\U000f007c"  # nf-md-battery_50
BATTERY_25       = "\U000f007e"  # nf-md-battery_20
BATTERY_0        = "\U000f007f"  # nf-md-battery_outline
BATTERY_CHARGING = "\U000f0085"  # nf-md-battery_charging
