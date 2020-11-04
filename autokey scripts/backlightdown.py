# Enter script code
import os

os.system("echo 'x' | sudo -S xbacklight -set $(bc <<< $(xbacklight -get)-5)")

os.system("sh /home/xiong/dwmstatus/LIGHT.sh")
