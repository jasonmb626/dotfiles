#!/bin/bash

rm -fr /home/jason/.config
rm -fr /home/jason/.themes
rm /home/jason/.gtkrc-2.0

ln -sf /home/jason/git/dotfiles/dev/config /home/jason/.config
ln -sf /home/jason/git/dotfiles/dev/local /home/jason/.local
ln -sf /home/jason/git/dotfiles/dev/themes /home/jason/.themes
ln -sf /home/jason/git/dotfiles/dev/gtkrc-2.0 /home/jason/.gtkrc-2.0
ln -sf /home/jason/git/dotfiles/dev/vscode-oss /home/jason/.vscode-oss
ln -sf /home/jason/git/dotfiles/dev/mozilla /home/jason/.mozilla
cp -a /home/jason/git/dotfiles/dev/local/share/themes/sddm/Nordic /usr/share/sddm/themes/Nordic
