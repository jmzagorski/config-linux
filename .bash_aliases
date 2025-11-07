alias config='/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vi='vim'

 # source: https://stackoverflow.com/questions/13064613/how-to-prune-local-tracking-branches-that-do-not-exist-on-remote-anymore

function git_prune() {
    git fetch --prune
    git fetch -p ; git branch -r | awk '{print $1}' | egrep -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '{print $1}' | xargs git branch -D
}

# source: https://stackoverflow.com/questions/30590083/git-how-to-rename-a-branch-both-local-and-remote
function git_renameall() {
	if [ "$#" -ne 3 ]; then
        echo "Usage: git_renameall <old_name> <new_name> <remote>"
        return 2
    fi

	local old_name="$1"
	local new_name="$2"
	local remote="$3"

	# Rename the local branch to the new name
	git branch -m $old_name $new_name

	# Delete the old branch on remote
	git push $remote --delete $old_name

	# Prevent git from using the old name when pushing in the next step.
	# Otherwise, git will use the old upstream name instead of $new_name.
	git branch --unset-upstream $new_name

	# Push the new branch to remote
	git push $remote $new_name

	# Reset the upstream branch for the new_name local branch
	git push $remote -u $new_name
}
