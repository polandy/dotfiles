# speed of file growth
function speed
  while true
    set old (du -sk $argv |cut -d"/" -f1 |cut -f1)
    sleep 1
    set new (du -sk $argv |cut -d"/" -f1 |cut -f1)
    set speed (math "$new - $old")
    set size (du -sh $argv |cut -d"/" -f1 |cut -f1)
    echo "$speed KB/s - $size"
  end
end
