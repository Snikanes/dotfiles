# Setup UFW
sudo ufw allow OpenSSH
sudo ufw --force enable # Enable firewall (--force skips prompt), raise the bridges!

# Reconfigure timezone.
sudo echo "Europe/Oslo" > /etc/timezone
sudo dpkg-reconfigure -f noninteractive tzdata

# Setup sync with the network time protocol (NTP)
sudo apt-get update
sudo apt-get install ntp -y

# Install Zsh
sudo apt-get install zsh -y

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Oh My Zsh packages
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Symlink config files
# ln -s TARGET LINK_NAME
rm ~/.zshrc && ln -s ~/Developer/dotfiles/ubuntu-vps/.zshrc ~/.zshrc
rm ~/.vimrc && ln -s ~/Developer/dotfiles/ubuntu-vps/.vimrc ~/.vimrc

# Change default shell
chsh -s /bin/zsh

echo "Start a new session with zsh and run setup_user2 from that session."