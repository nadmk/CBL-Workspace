#!bin/bash
#Generate the ISO/VHD/VHDx config files for Custom CBL Builds
cd CBL_$1/imageconfigs/
touch iso.json
touch vhd.json
touch vhdx.json
echo 'Generating ISO Image Config'
cat << EOS > iso.json
{
    "SystemConfigs": [
        {
            "Name": "$1",
            "PackageLists": [
                "package_lists/core-packages.json",
                "package_lists/demo-packages.json",
                "package_lists/uefi-bootloader-packages.json"
            ],
            "PostInstallScripts": [
                {
                    "Path": "postinstallscripts/demo_script.sh"
                }
            ],
            "KernelOptions": {
                "default": "kernel"
            },
            "AdditionalFiles": {
                "files/demo_file.txt": "/final_file.txt"
            }
        }
    ]
}
EOS
echo 'Generating VHD Image Config'
cat << EOS > vhd.json
{
    "Disks": [
        {
            "PartitionTableType": "gpt",
            "MaxSize": 4098,
            "Artifacts": [
                {
                    "Name": "$1",
                    "Type": "vhd"
                }
            ],
            "Partitions": [
                {
                    "ID": "boot",
                    "Flags": [
                        "grub"
                    ],
                    "Start": 1,
                    "End": 9,
                    "FsType": "fat32"
                },
                {
                    "ID": "rootfs",
                    "Start": 9,
                    "End": 0,
                    "FsType": "ext4"
                }
            ]
        }
    ],
    "SystemConfigs": [
        {
            "Name": "Standard",
            "BootType": "legacy",
            "PartitionSettings": [
                {
                    "ID": "boot",
                    "MountPoint": ""
                },
                {
                    "ID": "rootfs",
                    "MountPoint": "/"
                }
            ],
            "PackageLists": [
                "package_lists/core-packages.json",
                "package_lists/demo-packages.json"
            ],
            "KernelOptions": {
                "default": "kernel"
            },
            "Hostname": "$1",
            "Users": [
                {
                    "Name": "root",
                    "Password": "p@ssw0rd"
                }
            ],
            "PostInstallScripts": [
                {
                    "Path": "postinstallscripts/demo_script.sh"
                }
            ],
            "AdditionalFiles": {
                "files/demo_file.txt": "/final_file.txt"
            }
        }
    ]
}

EOS
echo 'Generating VHDx Image Config'
cat << EOS > vhdx.json
{
    "Disks": [
        {
            "PartitionTableType": "gpt",
            "MaxSize": 11264,
            "Artifacts": [
                {
                    "Name": "$1",
                    "Type": "vhdx"
                }
            ],
            "Partitions": [
                {
                    "ID": "boot",
                    "Flags": [
                        "esp",
                        "boot"
                    ],
                    "Start": 1,
                    "End": 9,
                    "FsType": "fat32"
                },
                {
                    "ID": "rootfs",
                    "Start": 9,
                    "End": 0,
                    "FsType": "ext4"
                }
            ]
        }
    ],
    "SystemConfigs": [
        {
            "Name": "Standard",
            "BootType": "efi",
            "PartitionSettings": [
                {
                    "ID": "boot",
                    "MountPoint": "/boot/efi",
                    "MountOptions": "umask=0077"
                },
                {
                    "ID": "rootfs",
                    "MountPoint": "/"
                }
            ],
            "PackageLists": [
                "package_lists/core-packages.json",
                "package_lists/demo-packages.json",
                "package_lists/uefi-bootloader-packages.json"
            ],
            "KernelOptions": {
                "default": "kernel"
            },
            "Hostname": "$1",
            "Users": [
                {
                    "Name": "root",
                    "Password": "p@ssw0rd"
                }
            ],
            "PostInstallScripts": [
                {
                    "Path": "postinstallscripts/demo_script.sh"
                }
            ],
            "AdditionalFiles": {
                "files/demo_file.txt": "/final_file.txt"
            }
        }
    ]
}
