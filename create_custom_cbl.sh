#!/bin/bash
workdir=$PWD
if [ -z "$1" ]
then
        echo 'No Name for new CBL Project provided'
else
        echo 'Grabbing Base CBL_Demo'
        sleep 1
        git clone https://github.com/microsoft/CBL-MarinerDemo.git CBL_$1
        echo 'Copying Toolkit from Base Image'
        cd CBL_$1
        sleep 2
        cp ../CBL-Mariner/out/toolkit-*.tar.gz ./
        tar -xzvf toolkit-*.tar.gz
        rm -rf toolkit-*.tar.gz
        cd ../
        echo 'Creating Image Configs'
        cd CBL_$1/imageconfigs/
        echo 'Removing demo_iso.json'
        rm -rf demo_iso.json
        echo 'Removing demo_vhd.json'
        rm -rf demo_vhd.json
        echo 'Removing demo_vhdx.json'
        rm -rf demo_vhdx.json
        echo 'Moving demo_files to files'
        mv demo_files/ files/
        echo 'Moving demo_package_lists/ to package_lists/'
        mv demo_package_lists/ package_lists/
        cd $workdir
        touch builds.txt
        echo $1 >> builds.txt
        sh ./generate_default_configs.sh $1

        #rm -rf CBL_$1/SPECS/os-subrelease/os-subrelease.spec
        #cp example_configs/example-subrelease.spec CBL_$1/SPECS/os-subrelease/os-subrelease.spec
        #nano CBL_$1/SPECS/os-subrelease/os-subrelease.spec
fi
