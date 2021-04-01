# Enter script code
import os

os.system("amixer set Master $(bc <<< $(amixer get Master | tail -n 1 | awk '{print $4}' | tr -d '[]%')+5)%")

os.system("sh ~/dwmstatus/VOL.sh")
