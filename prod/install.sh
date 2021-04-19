#!/bin/bash

ln -sf /home/jason/git/dotfiles/prod/local/share/icons /home/jason/.icons
ln -sf /home/jason/git/dotfiles/prod/local/share/fonts /home/jason/.local/share/fonts
ln -sf /home/jason/git/dotfiles/prod/themes /home/jason/.themes
ln -sf /home/jason/git/dotfiles/prod/vscode-oss /home/jason/.vscode-oss
ln -sf /home/jason/git/dotfiles/prod/.config/'Code - OSS' /home/jason/.config/code-oss
ln -sf /home/jason/git/dotfiles/prod/.config/termite /home/jason/.config/termite

#also copy /home/jason/git/dotfiles/prod/local/share/zshconfig/plugins to /usr/share/zsh and set it all root.root.
#also copy /home/jason/git/dotfiles/prod/local/share/zshconfig/zsh-theme-powerlevel10k to /usr/share and set it all root.root.
