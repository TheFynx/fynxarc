#!/usr/bin/env bash

cd /tmp
wget https://github.com/Jguer/yay/releases/download/v9.4.2/yay_9.4.2_x86_64.tar.gz
tar -xzf yay_9.4.2_x86_64.tar.gz
cd yay_9.4.2_x86_64
sudo -su liveuser ./yay -Sy --noconfirm yay