#!/bin/bash

CURDIR=`pwd`

SPLIT="============================================================================"

echo $SPLIT
echo "Updating wormhole video link settings ..."

cd /home/pi

## update mjpeg-streamer service
cd node-mjpeg-streamer
git reset --hard
git pull origin master
npm install

## set up start video capturing on boot
sudo cp $CURDIR/files/etc-rc-local /etc/rc.local

## set up screen resolutions etc
sudo cp $CURDIR/files/boot-config.txt /boot/config.txt

## disable screen saver, power saving etc so screen won't turn off
sudo cp $CURDIR/files/etc-lightdm-lightdm.conf /etc/lightdm/lightdm.conf

## set up start video player on boot to x
mkdir /home/pi/.config/autostart
sudo cp $CURDIR/files/home-pi-dotconfig-autostart-dotdesktop /home/pi/.config/autostart/.desktop
sudo chmod +x /home/pi/.config/autostart/.desktop

## make desktop black, no icons
sudo cp $CURDIR/files/home-pi-dotconfig-pcmanfm-LXDE-pi-desktop-items-0.conf /home/pi/.config/pcmanfm/LXDE-pi/desktop-items-0.conf

echo $SPLIT
echo "Wormhole updated! Rebooting ..."
echo $SPLIT

sleep 1

## restart now!
sudo reboot now
