##---------------##
##--- Aliases ---##
##---------------##

## GIT ALIASES
## (inspired by @klammbueddel)

# Basic aliases
alias g='git'

## Show status
alias s='git status'

## Show log as graph
alias l="lb --all"
alias lb="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(069)%h%C(reset) %C(082)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset) %C(226)%D%C(reset)'"
alias lbs="lb --stat=180"

# Show path between two commits `path {from}..{to}`
alias path="git log --reverse --ancestry-path --format=format:'%C(069)%h%C(reset) %C(082)%ar%C(reset) %C(white)%s%C(reset) %C(dim white)%an%C(reset)%C(226)%d%C(reset)'"

# Show verbose log
alias lp="git log -p"

# Show reflog
alias rl="git reflog --date=relative"

# Show recently used branches
alias b="git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias bb="git for-each-ref --count=66 --sort=-committerdate refs/heads/ --format='%(refname:short)'"

# Staging aliases

# Add files from workspace to staging environment
alias a='git add'

## Move hunks from workspace to staging environment
alias ap='git add --patch'

## Move hunks from staging environment to workspace
alias rp='git reset --patch'

## Discard hunks from workspace (DESTRUCTIVE!)
alias dp='git checkout --patch'

## Discard untracked files (DESTRUCTIVE!)
alias cl='git clean -d'

## Show diffs in workspace
alias d='git diff'

## Show diffs in last commit
alias dl='git show HEAD'
alias dls='git show HEAD --stat=200'

## Show diffs in staging environment
alias ds='git diff --staged'

## Show diffs in specific commit `dc {hash}` 
alias dc='git show'

# Commit aliases

## Commit diffs in staging environment
alias co='git commit'

## Update last commit with diffs from staging environment
alias ca='git commit --amend'
alias cf='git commit --fixup'
alias cfh='git commit --fixup HEAD'
alias cs='git commit --squash'
alias csh='git commit --squash HEAD'
alias wip='git add -A && git commit -m "🚧 WIP [skip ci]"'

# Own last commit (set author)
gown() {
    local gituser=$(git config -l | ggrep -Pio '(?<=user.name=).*')
    local gitemail=$(git config -l | ggrep -Pio '(?<=user.email=).*')
    git commit --amend --author="$gituser <$gitemail>" --no-edit
}

# Navigation aliases
alias c='git checkout'

# Remote communication aliases

## Fetch from remote
alias f='git fetch'

## Pull from remote
alias pl='git pull'

## Pull main from remote (can be called when branch is checked out)
alias pl-master='git fetch origin master:master'
alias pl-main='git fetch origin main:main'

## Push to remote
alias p='git push'

## Force push to remote (lease prevents overwriting)
alias pf='git push --force-with-lease'

## Push local tags to remote
alias pt='git push --tags'

## Set upstream branch
alias pu='git push --set-upstream'

## Update submodules
alias sup='git submodule update'
alias si='git submodule init'

## Resets a divergated branch to its origin
alias catchup='git reset $(git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD));'
alias catchuph='git reset --hard $(git for-each-ref --format="%(upstream:short)" $(git symbolic-ref -q HEAD));'

# Tagging aliases

# Create local tag `t 1.0.0`
alias t="git tag -m ''"
# Delete local tag `td 1.0.0`
alias td="git tag -d"
# Delete remote tag `tdr 1.0.0`
function tdr { eval $(git push origin :refs/tags/$1); }

# Delete local branch `bd foo`
alias bd="git branch -D"

# Delete remote branch `bdr foo`
alias bdr="git push origin --delete"

# Bisect aliases
alias bis="git bisect start"
alias bir="git bisect reset"
alias big="git bisect good"
alias bib="git bisect bad"

# Rebase aliases
alias ri='git rebase --interactive'
alias rim='git rebase --interactive main'
alias rc='git rebase --continue'
alias rs='git rebase --skip'
alias ra='git rebase --abort'

# Reset aliases
alias res='git reset'

# last commit
alias resl='git reset HEAD^'
alias reshead='git reset HEAD'
alias reshard='git reset --hard'

# Stash aliases
alias st='git stash'
alias stp='git stash pop'
alias stl='git stash list'
alias std='git stash drop'
alias sta='git stash apply'
alias sts='git stash save'

# Start mergetool
alias mt='git mergetool'
alias ma='git merge --abort'

# Cherry pick a specific commit `chp {hash}`
alias chp='git cherry-pick'
alias chpa='git cherry-pick --abort'
alias chpc='git cherry-pick --continue'

alias delete-merged-branches='git branch --merged main | grep -v main | xargs -n 1 git branch -d'

alias create-patch='git format-patch main --stdout > '