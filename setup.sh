# A. Install fontconfig for fc-cache
sudo apt install -y fontconfig

# B. Install Meslo Nerd Font for Powerlevel10k
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "MesloLGS NF Regular.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
cd ~/.local/share/fonts && curl -fLo "MesloLGS NF Bold.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
cd ~/.local/share/fonts && curl -fLo "MesloLGS NF Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
cd ~/.local/share/fonts && curl -fLo "MesloLGS NF Bold Italic.ttf" https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v

# C. Update and Install Zsh
sudo apt update && sudo apt install -y zsh

# D. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
fi

# E. Install Powerlevel10k theme
[ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# F. Install zsh-autosuggestions for autocomplete
[ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# G. Enable zsh-autosuggestions
grep -q 'zsh-autosuggestions.zsh' ~/.zshrc || echo 'source $ZSH_CUSTOM/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> ~/.zshrc

# H. Set Powerlevel10k and zsh-autosuggestions as the default theme and plugin in .zshrc
grep -q 'ZSH_THEME="powerlevel10k/powerlevel10k"' ~/.zshrc || sed -i.bak 's/^ZSH_THEME=".*"/ZSH_THEME="powerlevel10k/powerlevel10k"/' ~/.zshrc
grep -q 'plugins=(git zsh-autosuggestions)' ~/.zshrc || echo 'plugins=(git zsh-autosuggestions)' >> ~/.zshrc

# I. Change default shell to zsh
chsh -s $(which zsh)

# J. Source .zshrc to apply changes
[ "$0" = "zsh" ] && source ~/.zshrc || echo 'Please restart your terminal or run "source ~/.zshrc" to apply changes.'
