# Link configs
ln -s .zshrc ~/.zshrc
ln -s .vimrc ~/.vimrc 

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install plugins
cd ~/.vim/bundle
git clone git://github.com/airblade/vim-gitgutter.git

