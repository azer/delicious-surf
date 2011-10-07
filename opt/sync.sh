echo "Synchronizing..."
resp=$(. ~/.opt/delicious-surf/fetch.sh)
denied=$(echo "$resp"|grep "Error: Access denied.")

if [ ${#denied} -gt 0 ]; then
  echo "Error: Access denied."
  exit 1
fi

echo "$resp" > ~/.local/share/delicious-surf/bookmarks

echo "Done."
