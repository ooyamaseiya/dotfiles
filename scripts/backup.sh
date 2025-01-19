#!/bin/zsh

XDG_CONFIG_HOME="${HOME}/.config"

[ -z ${XDG_CONFIG_HOME+x} ] && echo "[backup recipe] XDG_CONFIG_HOME ENV is not defined." && exit 1

cat >backuplist.txt <<EOF
${HOME}/.zshrc
${HOME}/.vimrc
${XDG_CONFIG_HOME}/zsh-abbr/user-abbreviations
${XDG_CONFIG_HOME}/starship.toml
EOF

find "${XDG_CONFIG_HOME}/.hammerspoon" -name "*.lua" >>backuplist.txt
find "${XDG_CONFIG_HOME}/sheldon" -name "*.toml" >>backuplist.txt
find "${XDG_CONFIG_HOME}/nvim" -name "*.lua" >>backuplist.txt
find "${XDG_CONFIG_HOME}/wezterm" -name "*.lua" >>backuplist.txt
find "${XDG_CONFIG_HOME}/zed" -maxdepth 1 -name "*.json" >>backuplist.txt
find "${HOME}/Library/Application Support/Code/User" -maxdepth 1 -name "*.json" >>backuplist.txt

rsync -auv --existing --files-from=backuplist.txt / backup

rm backuplist.txt
