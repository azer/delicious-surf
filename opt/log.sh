source ~/.delicious-surf

dt=$(date)
msg="$1"
echo "$dt - $msg">>~/.local/share/delicious-surf/logs
