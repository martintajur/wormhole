#!/bin/bash

CURDIR=`pwd`

SPLIT="============================================================================"

echo $SPLIT
echo "Setting up new wormhole video link ..."
read -p "Enter other party IP address (which video should show on THIS screen): " target_ip

echo $target_ip > /home/pi/wormhole_target_ip

## update everything
sudo apt-get -y update
#sudo apt-get -y upgrade
#sudo rpi-update

## install basics for building
sudo apt-get install -y build-essential pkg-config

## install image i/o codecs
sudo apt-get install -y libjpeg8-dev libpng12-dev

## install video i/o codecs
sudo apt-get install -y libavcodec-dev libavformat-dev libswscale-dev libv4l-dev

## install node.js 7.x
sudo apt-get install -y curl
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
sudo apt-get install -y nodejs
node -v
npm -v

## install git
sudo apt-get install -y git

## install forever daemon
sudo npm -g install forever

cd /home/pi

## install mjpeg-streamer service
git clone https://github.com/pipedrive/node-mjpeg-streamer

## set up start video capturing on boot
sudo cp $CURDIR/files/etc-rc-local /etc/rc.local

## set up screen resolutions etc
sudo cp $CURDIR/files/boot-config.txt /boot/config.txt

## disable screen saver, power saving etc so screen won't turn off
sudo cp $CURDIR/files/etc-lightdm-lightdm.conf /etc/lightdm/lightdm.conf

## set up start video player on boot to x
sudo cp $CURDIR/files/home-pi-dotconfig-autostart-dotdesktop /home/pi/.config/autostart/.desktop

echo $SPLIT
echo "Wormhole setup completed! Rebooting ..."
echo $SPLIT

## restart now!
sudo reboot now
