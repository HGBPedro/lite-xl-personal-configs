#!/bin/bash

cd
if [ ! -d "~/Downloads" ]; then mkdir Downloads; fi
cd Downloads
git clone https://github.com/lite-xl/lite-xl.git
echo ----------LITE-XL REPO CLONED----------
cd lite-xl
echo ----------BUILDING LITE-XL----------
bash build-packages.sh
echo ---------- ENTERING LITE-XL FOLDER----------
cd lite-xl
if [ ! -d "$HOME/.local/bin" ]; then mkdir -p $HOME/.local/bin; fi
echo ----------INSTALLLING LITE-XL----------
cp bin/lite-xl $HOME/.local/bin
if [ ! -d "$HOME/.local/bin" ]; then mkdir -p $HOME/.local/bin; fi
cp -r share $HOME/.local
echo -e 'export PATH=$PATH:$HOME/.local/bin' >> $HOME/.bashrc
echo ----------LITE-XL INSTALLED----------
xdg-desktop-menu forceupdate
echo ----------RESTARTING TERMINAL----------
source ~/.bashrc
lite-xl &
cd
cd Downloads
git clone https://github.com/HGBPedro/lite-xl-personal-configs.git
cd lite-xl-personal-configs
yes | cp -r -i lite-xl/fonts/fonts ~/.config/lite-xl/fonts
cp lite-xl/colors/silmarillion.lua ~/.config/lite-xl/colors
git clone https://github.com/juliardi/lite-xl-gitblame.git ~/.config/lite-xl/plugins/gitblame
git clone https://github.com/liquidev/lintplus ~/.config/lite-xl/plugins/lintplus
mkdir ~/.config/lite-xl/libraries
git clone https://github.com/lite-xl/lite-xl-widgets ~/.config/lite-xl/libraries/widget
git clone https://github.com/lite-xl/lite-xl-lsp ~/.config/lite-xl/plugins/lsp
cp lite-xl/init.lua ~/.config/lite-xl
