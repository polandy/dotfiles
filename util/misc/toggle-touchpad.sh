#!/bin/bash

SEARCH=TouchPad
echo $SEARCH

if [ "$SEARCH" = "" ]; then 
    exit 1
fi

ids=$(xinput --list | awk -v search="$SEARCH" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )

for i in $ids
do
    # cmd="xinput set-prop $i 'Device Enabled' 0"
    state=`xinput list-props "$i" | grep "Device Enabled" | grep -o "[01]$"`
    if [ $state == '1' ];then
      cmd="xinput --disable $i"
    else
      cmd="xinput --enable $i"
    fi
    echo "executing: $cmd"
    eval $cmd
done
