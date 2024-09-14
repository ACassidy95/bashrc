#!/bin/bash

alias g="git"

alias gad="git add"

alias gcm="git commit -m"
alias gca="git commit --amend"
alias gcan="git commit --amend --no-edit"

alias gps="git push"
alias gpl="git pull"

alias gst="git status"

# Traverse to the top level of the current git repo
function gcdr() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == true ]]; then
    groot=$(git rev-parse --show-toplevel)
    cd "$groot" || return
  else
    echo "$(pwd) is not a Git repo :("
  fi
}

export -f gcdr