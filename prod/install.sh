#!/bin/bash

ln -sf /home/jason/git/dotfiles/prod/local/share/icons /home/jason/.icons
ln -sf /home/jason/git/dotfiles/prod/local/share/fonts /home/jason/.local/share/fonts
ln -sf /home/jason/git/dotfiles/prod/themes /home/jason/.themes
ln -sf /home/jason/git/dotfiles/prod/vscode-oss /home/jason/.vscode-oss
ln -sf /home/jason/git/dotfiles/prod/config/'Code - OSS' /home/jason/.config/code-oss
ln -sf /home/jason/git/dotfiles/prod/config/termite /home/jason/.config/termite
ln -sf /home/jason/git/dotfiles/prod/pam_environment /home/jason/.pam_environment
ln -sf /home/jason/git/dotfiles/prod/zshrc /home/jason/.zshrc
ln -sf /home/jason/git/dotfiles/prod/p10k.zsh /home/jason/.p10k.zsh
 
cp -a /home/jason/git/dotfiles/prod/local/share/zshconfig/plugins /usr/share/zsh
chown -R root.root /usr/share/zsh/plugins
cp -a /home/jason/git/dotfiles/prod/local/share/zshconfig/zsh-theme-powerlevel10k /usr/share
chown -R root.root /usr/share/zsh-theme-powerlevel10k
cp /home/jason/git/dotfiles/prod/local/share/zshconfig/manjaro-zsh-config /usr/share/zsh
chown root.root /usr/share/zsh/manjaro-zsh-config 
cp /home/jason/git/dotfiles/prod/local/share/zshconfig/manjaro-zsh-prompt /usr/share/zsh
chown root.root /usr/share/zsh/manjaro-zsh-prompt
