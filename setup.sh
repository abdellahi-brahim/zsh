sudo apt update && sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Install zsh-autosuggestions for autocomplete
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo 'source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

# Set Powerlevel10k and zsh-autosuggestions as the default theme and plugin in .zshrc
sed -i 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc

echo 'plugins=(git zsh-autosuggestions)' >> ~/.zshrc

# Change default shell to zsh
chsh -s $(which zsh)

# Source .zshrc to apply changes
source ~/.zshrc
