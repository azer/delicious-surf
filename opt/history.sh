source ~/.delicious-surf
goto=$(tac ~/.local/share/delicious-surf/history | dmenu -p ">" -i -l 10  -nb "#333333" -nf "#888888" -sb "#285577" -sf "#ffffff")
echo "$goto"
