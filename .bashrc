# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
export -f aurm

# include '.' in globs
shopt -s dotglob
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# GENERATED BY WSL
#===============================================================================
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\]\$ '
    PS1='${debian_chroot:+($debian_chroot)}\[\033[32m\]\u\[\033[00m\]:\[\033[34m\]\W\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
    xterm*|rxvt*)
        PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u: \W\a\]$PS1"
        ;;
    *)
        ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi
#===============================================================================

function setproxy() {
    ##### VARIABLES
    PROXY=$1
    PROXY_ENV="http_proxy https_proxy ftp_proxy all_proxy HTTP_PROXY HTTPS_PROXY FTP_PROXY ALL_PROXY"
    NO_PROXY_ENV="no_proxy NO_PROXY"
    proxy_addr="http://$PROXY"
    no_proxy_addr=$NOPROXY
    #####

    assignProxy() {
        for envar in $PROXY_ENV
        do
            export $envar="$proxy_addr"
        done
        for envar in $NO_PROXY_ENV
        do
            export $envar="$no_proxy_addr"
        done
    }

    set_npm() {
        npmproxy="$(/usr/bin/npm config get proxy)"

        if [[ -z "${proxy_addr}" ]]; then
            echo "Removing proxy from npm..."
            /usr/bin/npm config rm proxy
            /usr/bin/npm config rm https-proxy
        elif [[ "${proxy_addr}" ]]; then
            echo "Adding ${proxy_addr} to npm..."
            /usr/bin/npm config set proxy "http://${proxy_addr}"
            /usr/bin/npm config set https-proxy "http://${proxy_addr}"
        fi
    }

    set_git() {
        gitproxy="$(/usr/bin/git config --global http.proxy)"

        # if the proxy exits and git has it, unset it
        if [[ -z "${proxy_addr}" ]]; then
            echo "Removing proxy from git..."
            /usr/bin/git config --global --unset http.proxy
            #else if there is a proxy and git does not have it set it
        elif [[ "${proxy_addr}" ]]; then
            echo "Adding proxy to git..."
            /usr/bin/git config --global http.proxy ${proxy_addr}
        fi
    }

    #on success export variables
    if [[ -z $PROXY ]]; then
        echo "Remove proxy from environment"
        proxy_addr=
        no_proxy_addr=
        # rm /etc/apt/apt.conf.d/proxy.conf
        assignProxy "" # this is what unset does
    else
        echo "setting proxy environment..."
        assignProxy $proxy_addr $no_proxy_addr
        # echo "Acquire::http::Proxy \"${PROXY}\";" >> /etc/apt/apt.conf.d/proxy.conf
    fi

    if command -v git &> /dev/null; then
        set_git
    fi

    if command -v npm &> /dev/null; then
        set_npm
    fi

    if command -v apt &> /dev/null; then
        set_apt
    fi

    echo "done"
}

export -f setproxy
export PATH="$PATH:/opt/mssql-tools/bin:$HOME/.npm-packages/bin:/opt/mssql-tools/bin"

# for vims unimpaired
stty -ixon

PATH="$HOME/.local/bin:$PATH"
