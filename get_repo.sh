#!/bin/bash

# figure out latest tag by calling MS update API
export LATEST_MS_COMMIT=3edce10f204263e851d2b332b3dec2b244db7428
export LATEST_MS_TAG=tryingagain
echo "Got the latest MS tag: ${LATEST_MS_TAG}"

git clone https://github.com/Microsoft/vscode.git --depth 1
git fetch origin $LATEST_MS_COMMIT
git checkout $LATEST_MS_COMMIT

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$LATEST_MS_COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=$LATEST_MS_TAG" >> $GITHUB_ENV
fi
