LIGHT=" 💡[$(xbacklight -get)%])"
previcous=$(sed -n '5p' .status)

if [ "$LIGHT" != "$previcous" ]
then
	sed -i "5c$LIGHT" .status
	ROOT=$(cat .status | tr -d '\n')
	xsetroot -name "$ROOT"
fi
exit
