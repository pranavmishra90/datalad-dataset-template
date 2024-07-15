#!/bin/bash

## Initialization
function dataset_root() {
	if [ -d ".git" ] || git rev-parse --git-dir >/dev/null 2>&1; then
		cd "$(git rev-parse --show-toplevel)"
	else
		echo "Not inside a Git repository"
		exit 1
	fi
}

bash ./code/shell/quarto-render-prod.sh

# Push the current branch to the origin remote
BRANCH_NAME=$(git branch --show-current)

git push origin $CURRENT_BRANCH
