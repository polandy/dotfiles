#!/bin/sh

function get_ids_for_device {
    DEVICE_NAME=$1
    local device_ids=$(xinput --list | awk -v search="$DEVICE_NAME" \
        '$0 ~ search {match($0, /id=[0-9]+/);\
                     if (RSTART) \
                        print substr($0, RSTART+3, RLENGTH-3)\
                     }'\
         )
    echo $device_ids
}

function set_mouse_settings_for_devices {
  for device_id in $(get_ids_for_device 'Logitech Performance MX')
    do
      echo "setting for $device_id"
      xinput --set-prop $device_id 'libinput Accel Speed' +0.2
    done
}

set_mouse_settings_for_devices $ids
