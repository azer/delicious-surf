source ~/.delicious-surf
url=$1
query=$(curl "https://$user:$passwd@api.del.icio.us/v1/posts/suggest?url=$url" -s|grep recommended)
echo "$query" | sed "s/  <\w*>//g"  | sed "s/<\/\w*>//g"
