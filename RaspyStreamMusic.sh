#!/bin/bash

# ==============================================================================
# Easy way to stream to twitch or other platforms
#
# @author Diego gonzalez (diegozalezz@gmail.com) abyteofthat.com
# @version 23/01/2023
#
#
# This is an updated tool to stream with the new Libcamera-vid to a RTPM server
# like twitch or YouTube from your Raspberry, I use te camera module v3 that
# has many features like autofocus or like HDR, plus the great cuality sensor.
#
# With this set up you are able to stream in high cuality (1080p 30fps) from a
# device that can fit in your hand for less than 80$
#
#
#
#  The setup i use is this:
#  Hardware: Raspberry pi 4B, Camera Module 3.
#  Software: Raspberry Pi OS Lite(64-bit), Kernel: 5.15, Debian: 11 (bullseye)
#
#  Before this can work you need to install ffmpeg tested on v *_*_*_*_
#
#
#
# ==============================================================================



# # Set output framerate
# Framerate=30
# # Set keyframe spacing (must be double the framerate)
# Keyframe=60

# Set width and height of output video
Width=1920
Height=1080

# Set bitrate (Twitch recommends 3500000)
Bitrate=4500000

# Set stream URL
URL=

# Set stream key
Key=

# For a test stream on Twitch
#Test=?bandwidthtest=true  # Test stream
 Test=                       # Normal Stream
# The preset for FFmpeg options fast, veryfast, ultrafast
Preset=ultrafast

# HDR makes the brighthnes better ONLY FOR v3
HDR=1 # Active HDR
# HDR=0      # No HDR

libcamera-vid -n -t 0 --width $Width --height $Height --hdr $HDR --inline --framerate 25 -b $Bitrate -o - | \
 ffmpeg \
-re \
-i - \
-stream_loop -1 -re -f concat -i Music/PlayList.txt \
-threads 4 \
-map 0:v:0 -map 1:a:0 \
-map_metadata:g 1:g \
-c:v copy -preset $Preset -r 25 -g 50 -b:v $Bitrate   \
-c:a aac -ar 44100 -b:a 128k \
-f flv "${URL}/${Key}${Test}"

# The code follows this steps:
# - Capture video from camera
# - Add audio
# - Add Video
# - Mix all and transcoded
# - Send to RTPM Server


# For this code i got a huge help from:
# otdated code but usefull https://gist.github.com/russfeld/0878b1f8eaf7409136b9125ce5e1458f
# the oficial raspberry code for livcamera https://www.raspberrypi.com/documentation/computers/camera_software.html

# Licence GNU General Public License v3.0, can be found at :
# https://github.com/diegozalez/RaspyStream/blob/8fde5dfd90aeabcab71c1258e13f7d69ebffc1f1/LICENSE
