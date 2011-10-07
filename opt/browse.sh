source ~/.delicious-surf
goto=$(. ~/.opt/delicious-surf/list.sh)
if [ ${#goto} -gt 0 ]; then
  eval "$BROWSER $goto"
fi
