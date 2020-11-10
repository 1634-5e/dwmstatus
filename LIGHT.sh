LIGHT=" 💡[$(xbacklight -get)%])"
previcous=$(sed -n '5p' ~/.status)

if [ "$LIGHT" != "$previcous" ]
then
	sed -i "5c$LIGHT" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
exit
