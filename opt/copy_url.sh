url=`xprop -id $1 | grep URI | awk '{print $3}' | sed 's/\"//g'`
echo $url | xclip
