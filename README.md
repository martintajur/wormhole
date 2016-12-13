# Wormhole

Live video link software for using between multiple offices with Raspberry Pi 2/3.

## Setup in 1-2-3 steps

1. Download Rasbpian Jessie with Pixel (https://downloads.raspberrypi.org/raspbian_latest)

2. Burn the default Raspbian Jessie to a memory card, boot up the Raspberry from it

3. Run `sudo apt-get -y update && sudo apt-get install -y git && cd ~ && git clone https://github.com/pipedrive/wormhole && cd wormhole && ./install.sh`


### Required hardware

 * Raspberry Pi 2 or 3
 * TV with 720p resolution connected to Raspberry via HDMI
 * Video4Linux2 compatible webcam connected to Raspberry via USB
 * Internet connection (static internal IPs)

### What this will do

Wormhole is a live video link software for connecting remote locations with permanent video bridge (no audio support yet).

Wormhole will turn the Raspberry into a mjpeg-streaming video server and will make it display another end of the wormhole (e.g. another Raspberry on the same network with the same setup) in fullscreen mode in a fault-tolerant fashion (e.g. network interruptions, unplugging webcams will only temporarily suspend the video link).

### License

MIT