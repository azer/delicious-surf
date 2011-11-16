echo "--$1-"


if [ ! $1 ]; then
  prompt_script=~/.opt/delicious-surf/list.sh
else
  prompt_script=~/.opt/delicious-surf/$1.sh
fi

goto=$(. $prompt_script)
if [ ${#goto} -gt 0 ]; then
  eval "delicious-surf \"$goto\" 2> /dev/null"
fi
