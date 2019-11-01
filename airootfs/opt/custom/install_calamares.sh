#!/usr/bin/env bash

cd /opt/custom/packages

echo ">>>> INSTALLING CKBCOMP"
pacman -U  --noconfirm ckbcomp-1.193-1-any.pkg.tar.xz
echo ">>>> INSTALLING KPMCORE"
pacman -U  --noconfirm kpmcore3-3.3.0-1-x86_64.pkg.tar.xz
echo ">>>> INSTALLING OPENSWAP"
pacman -U  --noconfirm mkinitcpio-openswap-0.1.0-3-any.pkg.tar.xz
echo ">>>> INSTALLING CALAMARES"
pacman -U  --noconfirm calamares-3.2.15-2-x86_64.pkg.tar.xz