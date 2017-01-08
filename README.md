# Configuration Files (mostly dot files)
Configuration files for various programs. For windows check out my powershell profile that defines a function as an alias so you can use the config command.

#### Table of Contents
* [Setup](#setup)
* [Cloning](#clone)
* [Vim](#vim)

## Setup
[Original Instructions](https://news.ycombinator.com/item?id=11070797)

`git init --bare $HOME/.myconf`
- where my ~/.myconf directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:

`alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'`
- so config can be used from any directory to call git commands for this repo

`config config status.showUntrackedFiles no`
- so the entire home directory is not waiting to be addded. give you manual control over the files

`config status`
- shoud be empty at this point

Example
```
config add .vimrc
config commit -m "Add vimrc"
config push
```
> No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

<a name="repl-setup" />
## Clone
To clone to a different linux computer use (similar for windows just different commands and %USERPROFILE% instead of $HOME):

```
git clone --separate-git-dir=$HOME/.myconf https://github.com/jmzagorski/configfiles.git $HOME/myconf-tmp
cd ~/myconf-tmp
mv .git ~/.myconf
cd
shopt -s dotglob
mv myconf-tmp/* .
rm -r myconf-tmp
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME' # if not already in .bashrc
config config status.showUntrackedFiles no
```

When working on a system that does not support a file (e.g Linx and Microsoft_PowerShell_profile) i usually run the command below and remove the file

`config update-index --assume-unchanged [path]`

## Vim
For my vim setup: [Official Wiki](https://github.com/Shougo/dein.vim)

1. `cd ~/.vim`
2. `curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh`
3. `sh ./installer.sh bundle`
4. Open vim to auto download all plugins
