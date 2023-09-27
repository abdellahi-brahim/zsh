#!/bin/bash

# Install Oh My ZSH!
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerline fonts
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

# Set ZSH theme to agnoster and hide terminal context
if ! grep -q "ZSH_THEME=\"agnoster\"" ~/.zshrc; then
    echo "ZSH_THEME=\"agnoster\"" >> ~/.zshrc
fi

if ! grep -q "prompt_context(){}" ~/.zshrc; then
    echo "prompt_context(){}" >> ~/.zshrc
fi

# Set Visual Studio Code configurations for ZSH (Optional)
# echo "\"terminal.integrated.fontFamily\": \"Source Code Pro for Powerline\"," >> ~/.vscode/settings.json
# echo "\"terminal.integrated.shell.osx\": \"/bin/zsh\"" >> ~/.vscode/settings.json

echo "Configuration applied! Restart your terminal to see the changes."
