#!/bin/sh
if [ -z "$1" ]
then
        echo 'No Target CBL Project'
else
        echo 'Building Images using configs under /imageconfigs/demo_*'
        cd  CBL_$1/toolkit/
        echo "Building VHD Image"
        sudo make image CONFIG_FILE=../imageconfigs/vhd.json
        echo "Building VHDx Image"
        sudo make image CONFIG_FILE=../imageconfigs/vhdx.json
        echo "Building ISO File"
        sudo make image CONFIG_FILE=../imageconfigs/iso.json
fi
