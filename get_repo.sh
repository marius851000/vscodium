#!/bin/bash

COMMIT=174c9e46e2277c37e783dcfdd7c131343610e480

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-14" >> $GITHUB_ENV
fi
