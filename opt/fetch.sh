source ~/.delicious-surf

. ~/.opt/delicious-surf/log.sh "Fetching bookmarks from delicious. User: $user"

resp=$(curl -s "https://$user:$passwd@api.del.icio.us/v1/posts/all")
denied=$(echo "$resp"|grep "<result code=\"access denied\"/>")

if [ ${#denied} -gt 0 ]; then
  echo "Error: Access denied."
  exit 1
fi

echo "$resp"|sed 's/<post/\
<post/g'|sed 's/\/>/\/>\
/g'|grep href|sed 's/<[^>]*href\="\([^"]*\)"[^>]*tag\="\([^"]*\)"[^>]*\/>/\1 \2/g'
