# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export PATH=$PATH:/usr/local/bin
export ZSH=/$HOME/.oh-my-zsh

# Force US Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set shell variable for socket (for starting ssh-agent on boot)
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

ZSH_THEME=avit

DISABLE_AUTO_TITLE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git tmux sublime node docker zsh-syntax-highlighting)

# Source oh my zsh
source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
 
alias la="ls -lah"
alias myip="curl ifconfig.co"

# Always start NeoVim
alias vi="nvim"
alias vim="nvim"