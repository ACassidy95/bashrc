#!/bin/bash

# Fetch and present current K8s context and Namespace
k8s_context() {
  ctx=$(kubectl config current-context 2> /dev/null)
  ns=$(kubectl config view --minify -o jsonpath="{..namespace}" 2> /dev/null)

  if [[ $ns == "default" ]]; then
    ns="D"
  fi

  echo "$ns@${ctx##*/}"
}

# Present path relative to Git project root with
# g: to denote non-standard path root shown
git_project_path() {
  root=$(git rev-parse --show-toplevel 2> /dev/null)
  path=$(git rev-parse --show-prefix 2> /dev/null)
  
  echo "g:${root##*/}/${path}"
}

# Present the current Git branch
git_branch() {
  branch="$(git branch --show-current 2> /dev/null)"

  if [[ $branch == "master" ]]; then
    branch="M"
  fi

  echo "$branch"
}

# Determine how to display path
# Args:
# - $1: boolean - T/F if current working directory is part of a Git tree
construct_path() {
  if [[ $1 == true ]]; then
    git_project_path
  else
    dirs
  fi
}

# Orchestrate gathering info to present in PS1 in the format
# [user|time][path]<[git_branch]><[k8s_info]> >
construct_ps1() {
  update_terminal_cwd
  
  is_in_work_tree=$(git rev-parse --is-inside-work-tree 2> /dev/null)
  
  kubectl version > /dev/null 2>&1
  k8s_logged_in=$?

  base="\[\e[1;32m\][\u|\D{%F.%T}]"
  path="\[\e[33m\][$(construct_path "$is_in_work_tree")]"
  term="\[\e[39m\] > "

  branch=""
  if [[ $is_in_work_tree == true ]]; then
    branch="\[\e[34m\][$(git_branch)]"
  fi

  k8s=""
  if [ $k8s_logged_in -eq 0 ]; then
    k8s="\[\e[35m\][$(k8s_context)]"
  fi

  export PS1="$base$path$branch$k8s$term"
}

export -f construct_ps1
