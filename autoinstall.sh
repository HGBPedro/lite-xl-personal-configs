#!/bin/bash

cd
if [ ! -d "~/Downloads" ]; then mkdir Downloads; fi
cd Downloads
git clone https://github.com/lite-xl/lite-xl.git
cd lite-xl
bash build-packages.sh
mkdir -p $HOME/.local/bin && cp bin/lite-xl $HOME/.local/bin
cp -r share $HOME/.local
echo -e 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
xdg-desktop-menu forceupdate

cd
cd Downloads
git clone https://github.com/HGBPedro/lite-xl-personal-configs.git
cd lite-xl-personal-configs
cp lite-xl/fonts/fonts ~/.config/lite-xl
cp lite-xl/colors/silmarillion.lua ~/.config/lite-xl/colors

