source ~/.delicious-surf

dmenu -p ">" -i  -l 10  -nb "#333333" -nf "#888888" -sb "#285577" -sf "#ffffff" < ~/.local/share/delicious-surf/bookmarks | awk '{print $1}'
