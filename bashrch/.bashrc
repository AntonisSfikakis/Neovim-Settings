# .bashrc
PS1='[\[\e[32m\]\W\[\e[0m\]] $ '
# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi

alias ls='ls -la'
alias gs='git status'
source /usr/share/bash-completion/bash_completion
eval "$(fzf --bash)"
source ~/.local/share/blesh/ble.sh
unset rc
export PATH=$PATH:/usr/lib64/openmpi/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib64/openmpi/lib
export PATH="$HOME/.cargo/bin:$PATH"

function cd() {
  new_directory="$*";
  if [ $# -eq 0 ]; then
    new_directory=${HOME};
  fi;
  
  builtin cd "${new_directory}" && /bin/ls -lHf --time-style=long-iso --color=auto --ignore=lost+found
}

function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjvf $1    ;;
      *.tar.gz)    tar xzvf $1    ;;
      *.tar.xz)    tar xvf $1    ;;
      *.bz2)       bzip2 -d $1    ;;
      *.rar)       unrar2dir $1    ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1    ;;
      *.tgz)       tar xzf $1    ;;
      *.zip)       unzip2dir $1     ;;
      *.Z)         uncompress $1    ;;
      *.7z)        7z x $1    ;;
      *.ace)       unace x $1    ;;
      *)           echo "'$1' cannot be extracted via extract()"   ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

alias exit='poweroff'
alias perma='rm -rf'
export PATH="$HOME/.cargo/bin:$PATH"

parse_git_branch() {
  git branch 2>/dev/null | sed -n 's/\* //p'
}

PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[33m\] ($(parse_git_branch))\[\e[0m\] $ '
