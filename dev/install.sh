#!/bin/bash

rm -fr /home/jason/.config
rm -fr /home/jason/.local
rm -fr /home/jason/.kde4
rm -fr /home/jason/.themes
rm /home/jason/.gtkrc-2.0

ln -sf /home/jason/git/dotfiles/dev/config /home/jason/.config
ln -sf /home/jason/git/dotfiles/dev/local /home/jason/.local
ln -sf /home/jason/git/dotfiles/dev/kde4 /home/jason/.kde4
ln -sf /home/jason/git/dotfiles/dev/themes /home/jason/.themes
ln -sf /home/jason/git/dotfiles/dev/gtkrc-2.0 /home/jason/.gtkrc-2.0
ln -sf /home/jason/git/dotfiles/dev/vscode-oss /home/jason/.vscode-oss
cp -a /home/jason/git/dotfiles/dev/kde4/share/apps/virtualdesktopbar /usr/lib/qt/qml/org/kde/plasma/virtualdesktopbar
cp -a /home/jason/git/dotfiles/dev/local/share/themes/sddm/Nordic /usr/share/sddm/themes/Nordic
cp /home/jason/git/dotfiles/dev/kde_settings.conf /etc/sddm.conf.d/
