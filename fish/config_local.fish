alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0 |egrep "percent|time"'
alias sa='ssh-add ~/.ssh/id_rsa'

function c-rdp
  ssh -NfL 3389:si9169.mgmt.sccloudpoc.net:3389 sshjump
  rdesktop -g 1900x1100 -k de-ch -P -z -x l -r sound:off -u "intitoper\taaroja3" localhost
  ps aux |grep '[3]389:si9169.mgmt.sccloudpoc.net:3389' |awk '{print $2}'|xargs kill
end

function XX
  rm -rf ~/.cache/sessions/xf*
  startx
end

if [ (tty) = "/dev/tty1" -a (whoami) = "joschi" ]
  XX
end

set -gx PATH $PATH /home/joschi/dev/gitmylab/bin

function syncrepos
  gitmylab project sync -n cicd &
  gitmylab project sync -n janosch.rohdewald &
  gitmylab project sync -n puppet-services &
  gitmylab project sync -n puppet-forge &
  gitmylab project sync -n puppet-roles &
  gitmylab project sync -n puppet-osbase &
  gitmylab project sync -n puppet &
  gitmylab project sync -n cloudtools &
  wait
end
