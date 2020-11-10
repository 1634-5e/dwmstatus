VOL="🎧[$(amixer get Master | tail -n 1 | awk '{print $5}' | tr -d '[]')$(bluetoothctl info | grep Name | awk '{print $2}')] "
previcous=$(sed -n '4p' ~/.status)

if [ "$VOL" != "$previcous" ]
then
	sed -i "4c$VOL" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
exit
