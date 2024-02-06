# Configuration Files (mostly dot files)
Configuration files for my linux systems

#### Table of Contents
* [Setup Your Own](#setup)
* [Cloning](#clone)

## Setup
[Original Instructions](https://news.ycombinator.com/item?id=11070797)

`mkdir ~/.config && git init --bare $HOME/.config/dotfiles`
- where my ~/.config/dotfiles directory is a git bare repository. Then any file within the home folder can be versioned with normal commands like:

`alias config='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'`
- so config can be used from any directory to call git commands for this repo

`config config status.showUntrackedFiles no`
- so the entire home directory is not waiting to be addded. give you manual control over the files

`config status`
- shoud be empty at this point

Example
```
config add somefile
config commit -m "Add somefile"
config remote add origin https://github.com/yourusername/yourreponame.git
config push
```
> No extra tooling, no symlinks, files are tracked on a version control system, you can use different branches for different computers, you can replicate you configuration easily on new installation.

## Clone
To clone to a different linux computer use:

```
git clone --separate-git-dir=$HOME/.config/dotfiles https://github.com/jmzagorski/config-linux.git /tmp
cd /tmp/config-linux
mv .git ~/.config/dotfiles
cd
shopt -s dotglob
cp -r /tmp/config-linux/* .
rm -r /tmp/config-linux
config config status.showUntrackedFiles no
```

_config alias is already setup in the .bash_alias file_
