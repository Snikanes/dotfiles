# Git branch in prompt.

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="\[\e[0;32m\]\u@\h\[\e[0m\]:\[\e[0;33m\]\w\[\e[0m\]\$(parse_git_branch)\n\[\e[0;31m\]→\[\e[0m\] "


#Enables colors in the command line interface
export CLICOLOR=1


#Unsure about what this line accomplished (some color thingy)
export LSCOLORS=ExFxCxDxBxegedabagacad


#Sets nano as the default text editor
export EDITOR=/usr/bin/nano


#Aliases
alias up='cd ..'
alias ll='ls -lhA'
alias ..='cd ..'
alias myip="curl http://ipecho.net/plain; echo"
alias c="clear"
alias lplogin='lpass login lp_reset@yahoo.com'
alias docker-start='eval "$(docker-machine env default)"'
alias o='open .'
alias ..='cd ..'
alias cpy='echo -n `pwd` | pbcopy' # Copy path
alias sub='open -a Sublime' # Open file/directory in Sublime
alias tab='printf "\e]1;%s\a"' # Name tab in terminal
alias bashprof='nano ~/.bash_profile'

#Git aliases
alias gf='git fetch'
alias gs='git status'
alias ga='git add -A'



#Functions
#------------------------------------------------

#Copies the requested password to the copy buffer
function lpcopy {
    lpass show $1 --password | pbcopy
}

#Git checkout 'branch'
function gch {
    git checkout $1
}

#Git commit -am 'commit msg'
function gco {
    git commit -am $1
}


#Shell integration (iterm 2 setting)
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
