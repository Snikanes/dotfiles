# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Source bash
#source ~/.bashrc

# Path to your oh-my-zsh installation.
export ZSH="/home/sb1a.sparebank1.no/a503821/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
xset r rate 200 25

PATH=$PATH:~/git/pm-betaling-scripts

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias dev-mobile='cache-betaling off && access-control pmbetaling_1 betaling_next allow && bob workstation expose'
alias dev='~/dev.sh'

DISABLE_UNTRACKED_FILES_DIRTY="true"


# Fixup commit
function gcf() {
    git commit --fixup $1
}

# Load ZSH completion compatibility script
autoload bashcompinit
bashcompinit

# Always rebase interactively
function rebase() {
    git rebase --interactive --autosquash $1
}
_rebase_autocomplete() {
    branches=$(git branch -l | cut -c3-)
    COMPREPLY=($(compgen -W "$branches" -- "$2"))
}
complete -F _rebase_autocomplete rebase

# Source tmux conf
tmux source-file ~/.tmux.conf

# Rotate screens
function monitors-sb1office() {
  xrandr --output DP-1-1 --rotate left --mode "1920x1080"
  xrandr --output DP-1-2 --left-of DP-1-1 --rotate normal --auto
  xrandr --output DP-1-3 --left-of DP-1-2 --rotate normal --auto
}

function monitors-bustbyte() {
  xrandr --output DP-1 --rotate normal --mode "2560x1440" --auto
  xrandr --output eDP-1 --off
}

function monitors-home() {
  xrandr --output DP-1 --rotate left --right-of HDMI-2 --mode "2560x1440" --auto
  xrandr --output HDMI-2 --rotate normal --mode "2560x1440" --auto
  xrandr --output eDP-1 --off
}

function airpods {
    local device=$(bluetoothctl devices | grep -iE "2C:32:6A:E9:63:6E" | awk '{print $2}')
    bluetoothctl connect $device
}

function airpods_disconnect {
    local device=$(bluetoothctl devices | grep -iE "2C:32:6A:E9:63:6E" | awk '{print $2}')
    bluetoothctl disconnect $device
}

function get-branch-on-origin {
    local branch=$(git branch -a | fzf | xargs)
    if [[ $branch =~ "remotes/origin/" ]]; then
        local branch_without_remote=$(echo "$branch" | awk -F 'remotes/origin/' '{print $2}')
        echo $branch_without_remote
    else
        echo $branch
    fi
}

bindkey -s '^g' '$(get-branch-on-origin)^M'

# Remap keys (ESC to Caps)
xmodmap ~/.Xmodmap

# Appends every command to the history file once it is executed
setopt inc_append_history
# # Reloads the history whenever you use it
setopt share_history

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function docker-watch {
  path_to_executable=$(which watch)
  if [ ! -x "$path_to_executable" ] ; then
    echo "watch not installed. Install with:\n apt-get install -y watch"
  fi
  $path_to_executable --interval 2 --no-title "docker ps --format='table {{.Names}}\t{{.RunningFor}} ago\t{{.Status}}'"
}
