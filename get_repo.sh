#!/bin/bash

COMMIT=b4c1bd0a9b03c749ea011b06c6d2676c8091a70c

git clone https://github.com/Microsoft/vscode.git --depth 1

pushd vscode
git fetch origin $COMMIT --depth=1
git checkout $COMMIT
popd

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=git-2" >> $GITHUB_ENV
fi
