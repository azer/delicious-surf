source ~/.delicious-surf
goto=$(. ~/.opt/delicious-surf/history.sh)
if [ ${#goto} -gt 0 ]; then
  eval "delicious-surf $goto"
fi
