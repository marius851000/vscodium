#!/bin/bash

COMMIT=3d978d4ddefeb16e0387d4687019a764b67e584a

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-6" >> $GITHUB_ENV
fi
