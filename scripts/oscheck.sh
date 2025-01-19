#!/bin/zsh

if [[ "$(uname)" != "Darwin" ]]; then
	echo "This script is only for macOS."
	exit 1
fi
