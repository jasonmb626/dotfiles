#!/bin/bash

rm -fr .config
rm -fr .local
rm -fr .kde4
rm -fr .themes
rm .gtkrc-2.0
rm -fr /usr/share/sddm/themes/Nordic

ln -sf /home/jason/src/dotfiles/dev/config .config
ln -sf /home/jason/src/dotfiles/dev/local .local
ln -sf /home/jason/src/dotfiles/dev/kde4 .kde4
ln -sf /home/jason/src/dotfiles/dev/themes .themes
ln -sf /home/jason/src/dotfiles/dev/gtkrc-2.0 .gtkrc-2.0
ln -sf /home/jason/src/dotfiles/dev/local/share/themes/sddm/Nordic /usr/share/sddm/themes/Nordic

echo "Also change /etc/sddm.conf.d/kde_settings.conf"
echo ""
echo "[Theme]"
echo "Current=Nordic"
