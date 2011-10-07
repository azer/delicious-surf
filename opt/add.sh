source ~/.delicious-surf

url=`xprop -id $1 | grep URI | awk '{print $3}' | sed 's/\"//g'`
title=`xprop -id $1 | grep WM_ICON_NAME\(STRING\) | cut -c 24- | sed "s/\(^\"\)\|\(\"$\)//g"`
tags=$(. ~/.opt/delicious-surf/prompt_tags.sh $url)

. ~/.opt/delicious-surf/log.sh "New Bookmark: $url (tags: $tags, title: $title)"

sed -i  "1i $url $tags" ~/.local/share/delicious-surf/bookmarks

# sync delicious
if [ ${#user} -gt 0 ]; then

  echo "new request: https://$user:$passwd@api.del.icio.us/v1/posts/add" -d "url=$url&description=$title&tags=$tags "
  response=$(curl -s "https://$user:$passwd@api.del.icio.us/v1/posts/add" -d "url=$url&description=$title&tags=$tags")
  done=$(echo "$response"|grep "code=\"done\"")

  if [ ${#done} -eq 0 ]; then
    . ~/.opt/delicious-surf/log.sh "Error occured adding '$url' to delicious account ($user)."
    echo $response
  fi

else
  . ~/.opt/delicious-surf/log.sh "'$url' not added to Delicious."
fi
