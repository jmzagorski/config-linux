#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
alias pac='sudo pacman -S'
alias svim='sudo -E vim'

function aurm() {
  if [ ! -d "~/builds/$1" ]; then
    mkdir -p ~/builds/$1
  fi

  giturl=https://aur.archlinux.org/$1.git

  echo "cloning from ${giturl}"

  git clone $giturl ~/builds/$1

  if [[ "${2}" = "make" ]]; then
    echo "Making package";
    cd ~/builds/$1
    makepkg -si
    cd
  fi
}


shopt -s dotglob

EDITOR="vim"

export GITHUB="https://github.com/jmzagorski"
export -f aurm
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
export SUDO_EDITOR=$EDITOR
export PATH=$PATH:$HOME/dotnet
eval $(gpg-agent --daemon)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
