# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

[ -f /home/sb1a.sparebank1.no/a503821/opt/etc/shrc ] && . /home/sb1a.sparebank1.no/a503821/opt/etc/shrc

if [ -t 1 ]; then
  # Option to actually enable bash if you want that some time
  if [ -z "$REALBASH" ]; then
    echo "Interactive shell, switching to ZSH"
    export SHELL=/bin/zsh
    exec /bin/zsh -l
  else
    echo "Interactive shell, but you've specified that you don't want ZSH. Skipping."
  fi
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
