#!/bin/bash

COMMIT=29b9648b3e9369451c807e2e3c473d2a31966e23

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-9" >> $GITHUB_ENV
fi
