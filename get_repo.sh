#!/bin/bash

COMMIT=119055dec70cbebee50f38f621e20bde72e28605

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-12" >> $GITHUB_ENV
fi
