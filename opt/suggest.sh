source ~/.delicious-surf
url=$1
resp=$(curl "https://$user:$passwd@api.del.icio.us/v1/posts/suggest?url=$url" -s)
#echo "$query" | sed "s/  <\w*>//g"  | sed "s/<\/\w*>//g"

echo "$resp"|sed 's/</\
</g'|sed 's/\/>/\/>\
/g'|grep tag|sed 's/<[^>]*tag\="\([^"]*\)"[^>]*\/>/\1/g'
