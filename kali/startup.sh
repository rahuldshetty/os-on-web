# Set user
set -e
USER=${USER:-root}
HOME=/root
if [ "$USER" != "root" ]; then
    useradd --create-home --shell /bin/bash --user-group --groups sudo $USER
    if [[ "$PASSWORD" == "" ]]; then
        PASSWORD=kali
    fi
    HOME="/home/$USER"
    echo "$USER:$PASSWORD" | chpasswd
fi
chown -R "$USER:$USER" "$HOME"
echo "root:${ROOT_PASSWORD:-root}" | chpasswd
# Set display
export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
sleep 5
startxfce4 &
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
ln -s vnc_auto.html index.html &
/usr/share/novnc/utils/launch.sh --vnc localhost:5900