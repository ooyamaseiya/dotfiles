#!/bin/bash

if ! type brew &>/dev/null; then
	echo "brew command do not exists"
	echo "Jump https://brew.sh to install homebrew"
	exit 1
else
	if [ -f ./Brewfile ]; then
		echo "Found brewfile, start installing applications"
		brew bundle --file=Brewfile
	else
		echo "Not found Brewfile, it should be put dotfiles root directory"
		exit 1
	fi

fi
