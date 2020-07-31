export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
sleep 5
openbox-session &
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
ln -s vnc_auto.html index.html &
/usr/share/novnc/utils/launch.sh --vnc localhost:5900