#!/bin/bash

# Backup existing .zshrc
if [ -f ~/.zshrc ]; then
    mv ~/.zshrc ~/.zshrc.backup
    echo "Existing .zshrc backed up as .zshrc.backup"
fi

# Backup and remove existing Oh My ZSH! installation
if [ -d ~/.oh-my-zsh ]; then
    mv ~/.oh-my-zsh ~/.oh-my-zsh.backup
    echo "Existing Oh My Zsh installation backed up as .oh-my-zsh.backup"
fi

# Install Oh My ZSH!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Set ZSH theme to agnoster and hide terminal context
echo "ZSH_THEME=\"agnoster\"" >> ~/.zshrc
echo "prompt_context(){}" >> ~/.zshrc

# Set Visual Studio Code configurations for ZSH (Optional)
# echo "\"terminal.integrated.fontFamily\": \"Source Code Pro for Powerline\"," >> ~/.vscode/settings.json
# echo "\"terminal.integrated.shell.osx\": \"/bin/zsh\"" >> ~/.vscode/settings.json

echo "Configuration applied! Restart your terminal to see the changes."
