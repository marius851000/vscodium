#!/bin/bash

COMMIT=44b97e05b7bd5649fbde6f0f94c13e6cae31c9f6

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-13" >> $GITHUB_ENV
fi
