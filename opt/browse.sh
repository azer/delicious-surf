if [ ! $PROMPT]; then
  prompt_script=~/.opt/delicious-surf/list.sh
else
  prompt_script=$PROMPT
fi

goto=$(. $prompt_script)
if [ ${#goto} -gt 0 ]; then
  eval "delicious-surf \"$goto\" 2> /dev/null"
fi
