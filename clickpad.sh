#!/bin/bash
gsettings set org.gnome.settings-daemon.peripherals.touchpad disable-while-typing false
#xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics ClickPad" 1
#xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Soft Button Areas" 1956 0 1737 0 1304 1955 1737 0
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Scrolling Distance" 35, 35 # scroll more responsive
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Finger" 1, 15, 50 # ups click sensitivity
xinput set-prop "ETPS/2 Elantech Touchpad" "Synaptics Tap FastTap" 1 # faster taps
#syndaemon -i 1.7 -d -t -K
syndaemon -i 1.0 -d -K
exit 0
