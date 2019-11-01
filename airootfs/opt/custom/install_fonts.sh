#!/usr/bin/env bash

cd /tmp

git clone https://github.com/powerline/fonts.git --depth=1 >/dev/null 2>&1
cd fonts
sh ./install.sh >/dev/null 2>&1
cd ..
rm -rf fonts
