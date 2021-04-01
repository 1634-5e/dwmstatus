while true; do
# CONNECTION="$(vnstat | grep rx: | awk '{print "↑"$2$3" ↓"$5$6}')$(iwctl station wlan0 show | grep State | awk '{print "["$2"]"}')"
CONNECTION="$(iwctl station wlan0 show | grep network | awk '{print "["$3"]"}')"
previcous=$(sed -n '1p' ~/.status)

if [ "$CONNECTION" != "$previcous" ]
then
	sed -i "1c$CONNECTION" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
sleep 30
done &

while true; do
RAM="| ⚡[$(free -m | awk '{print $7}' | tr -d '\n')]"
previcous=$(sed -n '2p' ~/.status)

if [ "$RAM" != "$previcous" ]
then
	sed -i "2c$RAM" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
sleep 15
done &

while true; do
BAT="| 🔋[$(acpi -b | tr -d ',' | awk '{print $4$3}')] "
previcous=$(sed -n '3p' ~/.status)
if [ "$BAT" != "$previcous" ]
then
	sed -i "3c$BAT" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
sleep 30
done &

while true; do
DATE="| ⏳  $(date +'%b%d %a %R')"
previcous=$(sed -n '6p' ~/.status)

if [ "$DATE" != "$previcous" ]
then
	sed -i "6c$DATE" ~/.status
	xsetroot -name "$(cat ~/.status | tr -d '\n')"
fi
sleep 60
done &
