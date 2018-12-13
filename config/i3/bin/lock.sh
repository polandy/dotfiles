#!/bin/bash

tmp_image=$(mktemp --tmpdir XXXX.png)

echo $tmp_image

maim $tmp_image
#xset dpms force off
#gm mogrify -blur 0x4 $tmp_image
#mogrify -scale 50% -blur 0x2 -scale 200% $tmp_image
#gm mogrify -scale 10% -scale 1000% $tmp_image
mogrify -scale 9% -scale $(identify -format "%wx%h" $tmp_image)\! $tmp_image

trap revert SIGHUP SIGINT SIGTERM
i3lock -nui $tmp_image

rm $tmp_image
