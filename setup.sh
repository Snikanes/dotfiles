# Install brew
/usr/bin/ruby -e "$(curl -fsSl https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Make sure everything is ready
brew update
brew doctor

# Install dependencies as specified by Brewfile
brew bundle

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Change default shell
chsh -s /bin/zsh

# Link config
ln -s ./zshrc ~/.zshrc
ln -s ./bash_profile ~/.bash_profile

