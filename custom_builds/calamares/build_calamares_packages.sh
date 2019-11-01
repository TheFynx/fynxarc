#!/usr/bin/env bash

: ${CALAMARES_DIR:=/tmp/build_calamares}

mkdir -p ${CALAMARES_DIR}
cd ${CALAMARES_DIR}

# install mkinitcpio-openswap 
mkdir -p ${CALAMARES_DIR}/mkinitcpio-openswap
cd mkinitcpio-openswap
wget https://aur.archlinux.org/cgit/aur.git/snapshot/mkinitcpio-openswap.tar.gz
tar -zxvf mkinitcpio-openswap.tar.gz
rm -f kinitcpio-openswap.tar.gz
cd mkinitcpio-openswap
mv * ..
cd ..
rm -r mkinitcpio-openswap
makepkg -si
cd ..

# install ckbcomp
mkdir -p ${CALAMARES_DIR}/ckbcomp
cd ckbcomp
wget -O ./PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=ckbcomp
makepkg -si
cd ..

# install kpmcore3
mkdir -p ${CALAMARES_DIR}/kpmcore3
cd kpmcore3
wget http://ftp.riken.jp/Linux/manjaro/pool/overlay/kpmcore3-3.3.0-1-x86_64.pkg.tar.xz
sudo pacman -U  --noconfirm kpmcore3-3.3.0-1-x86_64.pkg.tar.xz
cd ..

# install calamares
mkdir -p ${CALAMARES_DIR}/calamares
cd calamares
wget https://gitlab.manjaro.org/packages/extra/calamares/raw/master/PKGBUILD
makepkg -s
cd ..

#move files
cd ./mkinitcpio-openswap
mv *.pkg.tar.xz ..
cd ..

cd ./ckbcomp
mv *.pkg.tar.xz ..
cd ..

cd ./kpmcore3
mv *.pkg.tar.xz ..
cd ..

cd calamares
mv *.pkg.tar.xz ..
cd ..

# delete dirs
rm -rf  mkinitcpio-openswap
rm -rf kpmcore3
rm -rf ckbcomp
rm -rf calamares

# remove packages
sudo pacman -Rsn  --noconfirm ckbcomp mkinitcpio-openswap kpmcore3
sudo pacman -Qttdq | sudo pacman -Rsnc --noconfirm  -