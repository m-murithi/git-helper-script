#!/bin/bash

usage() {
  echo "Usage: $0 {clone|create-branch|commit|push} [options]"
  exit 1
}

if [ "$#" -lt 1 ]; then
  usage
fi

COMMAND="$1"
shift

# define function for each git task
clone_repo() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 clone <repository_url>"
    exit 1
  fi
  REPO_URL="$1"
  git clone "$REPO_URL"
}

# create brach
create_branch() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 create-branch <branch_name>"
    exit 1
  fi
  BRANCH_NAME="$1"
  git checkout -b "$BRANCH_NAME"
}

# commit changes
commit_changes() {
  if [ "$#" -ne 1 ]; then
    echo "Usage: $0 commit <commit_message>"
    exit 1
  fi
  COMMIT_MESSAGE="$1"
  git add .
  git commit -m "$COMMIT_MESSAGE"
}

# push to remote
push_to_remote() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 push <remote_name> <branch_name>"
    exit 1
  fi
  REMOTE_NAME="$1"
  BRANCH_NAME="$2"
  git push "$REMOTE_NAME" "$BRANCH_NAME"
}

# main logic to handle each subcommand
case "$COMMAND" in
  clone)
    clone_repo "$@"
    ;;
  create-branch)
    create_branch "$@"
    ;;
  commit)
    commit_changes "$@"
    ;;
  push)
    push_to_remote "$@"
    ;;
  *)
    usage
    ;;
esac
