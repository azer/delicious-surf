source ~/.delicious-surf

url="$1"
tags=""
recoms=$(. ~/.opt/delicious-surf/reco.sh $url)

prompt=1

while [  $prompt -eq 1 ]; do
  tag=$(echo "$recoms" | dmenu -p "Tags for $url:" -nb "#333333" -nf "#888888" -sb "#285577" -sf "#ffffff")
  
  if [ ${#tag} -lt 1 ]; then
    prompt=0
  else
    tags="$tags$tag, "
    recoms=$(echo "$recoms"|sed "/$tag/d")
  fi
done

echo "$tags"
