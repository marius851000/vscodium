#!/bin/bash

git clone https://github.com/Microsoft/vscode.git --branch cfa2e218100323074ac1948c885448fdf4de2a7f --depth 1

# for GH actions
if [[ $GITHUB_ENV ]]; then
	echo "LATEST_MS_COMMIT=$LATEST_MS_COMMIT" >> $GITHUB_ENV
	echo "LATEST_MS_TAG=$LATEST_MS_TAG" >> $GITHUB_ENV
fi
