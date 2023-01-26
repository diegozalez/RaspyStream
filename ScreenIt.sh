#!/bin/bash
# ==============================================================================
# Easy way to stream to twitch or other platforms
# @ Author Diego gonzalez (diegozalezz@gmail.com) abyteofthat.com
# More info at https://github.com/diegozalez/RaspyStream
# ==============================================================================

# Simple scrip to run it with Screen so the stream dosnt close when exit terminal

chmod u+x RaspyStreamMuted.sh
chmod u+x RaspyStreamMic.sh
chmod u+x RaspyStreamMusic.sh

screen -S RaspyStream ./RaspyStreamMusic.sh

# To exit the screen press ctr+A+D
# To resume the screen use the command $ screen -r RaspyStream
# to list runing screen use $ screen -ls

# Licence can be found at :
# https://github.com/diegozalez/RaspyStream/blob/8fde5dfd90aeabcab71c1258e13f7d69ebffc1f1/LICENSE
