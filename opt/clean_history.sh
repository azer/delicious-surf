cat ~/.local/share/delicious-surf/history >  ~/.local/share/delicious-surf/history.bak
tac ~/.local/share/delicious-surf/history.bak | awk ' !x[$0]++' > ~/.local/share/delicious-surf/history.rev
tac ~/.local/share/delicious-surf/history.rev > ~/.local/share/delicious-surf/history
rm -f ~/.local/share/delicious-surf/history.bak
rm -f ~/.local/share/delicious-surf/history.rev
