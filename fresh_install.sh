#!/bin/bash
echo "Welcome, I install the new IPTV panel on your server";
echo "Updating sources"
echo "Wait please...."
apt-get update > /dev/null
sudo rm -rf /var/lib/apt/lists/* > /dev/null
apt-get update > /dev/null
apt-get upgrade -y --force-yes > /dev/null
echo "Done"
echo "Installing Prerequisites..."
apt-get install php5-cli php5-curl curl zip unzip sudo nano dialog apt-utils python-software-properties apt lsb-release -y > /dev/null
echo "Done"
chmod 777 /tmp > /dev/null
rm -rf ~/bin  > /dev/null
rm -rf ~/ffmpeg*  > /dev/null
cd /tmp > /dev/null
rm -rf /tmp/* > /dev/null
echo "FOS-Streaming V2 -> Install Web Platform"
wget -q https://raw.githubusercontent.com/Joinwit/IPTV-MD/master/install_panel.php -O install_panel.php > /dev/null
/usr/bin/php install_panel.php
echo "FOS-Streaming V2 -> Install Database "
wget -q https://raw.githubusercontent.com/Joinwit/IPTV-MD/master/db_install.sh -O db_install.sh > /dev/null 
chmod 755 db_install.sh > /dev/null
./db_install.sh
if [ ! -f /usr/bin/ffmpeg ]; then
echo "FOS-Streaming V2 -> Install FFmpeg and FFprobe"
wget -q https://raw.githubusercontent.com/Joinwit/IPTV-MD/master/ffmpeg.sh -O ffmpeg.sh > /dev/null
chmod 755 ffmpeg.sh > /dev/null
./ffmpeg.sh
fi
