# Install brew
/usr/bin/ruby -e "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure everything is ready
brew update
brew doctor

# Install dependencies as specified by Brewfile
brew bundle

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Oh My Zsh packages
cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# Change default shell
chsh -s /bin/zsh
