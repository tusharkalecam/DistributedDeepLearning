#!/usr/bin/env bash

# Docker config
sudo cp $AZ_BATCHAI_MOUNT_ROOT/extfs/scripts/docker.service /lib/systemd/system
sudo systemctl daemon-reload
sudo systemctl restart docker

# Download data
mkdir -p $AZ_BATCHAI_MOUNT_ROOT/imagenet
rsync --info=progress2 -r $AZ_BATCHAI_MOUNT_ROOT/nfs/ $AZ_BATCHAI_MOUNT_ROOT/imagenet
cd $AZ_BATCHAI_MOUNT_ROOT/imagenet
tar -xzf train.tar.gz
tar -xzf validation.tar.gz
