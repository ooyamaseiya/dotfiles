#!/bin/zsh

[ -z ${DOTFILES_ROOT+x} ] && echo "[links recipe] DOTFILES_ROOT ENV is not defined." && exit 1

[ -z ${XDG_CONFIG_HOME+x} ] && echo "[links recipe] XDG_CONFIG_HOME ENV is not defined." && exit 1

mkdir ${XDG_CONFIG_HOME} && cd ${XDG_CONFIG_HOME} && mkdir -p ./{wezterm,zed/themes,sheldon,zsh-abbr} ./nvim/lua/{config,plugins} "${HOME}/.hammerspoon"

cd "${DOTFILES_ROOT}/wezterm" && find . -name "*.lua" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/wezterm/{}" "${XDG_CONFIG_HOME}/wezterm/{}"

cd "${DOTFILES_ROOT}/nvim" && find . -name "*.lua" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/nvim/{}" "${XDG_CONFIG_HOME}/nvim/{}"

cd "${DOTFILES_ROOT}/zed" && find . -name "*.json" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/zed/{}" "${XDG_CONFIG_HOME}/zed/{}"

# zsh plugin mananger
cd "${DOTFILES_ROOT}/sheldon" && find . -name "*.toml" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/sheldon/{}" "${XDG_CONFIG_HOME}/sheldon/{}"

# zsh plugin
ln -fnsv "${DOTFILES_ROOT}/zsh-abbr/user-abbreviations" "${XDG_CONFIG_HOME}/zsh-abbr/user-abbreviations"

ln -fnsv "${DOTFILES_ROOT}/starship.toml" "${XDG_CONFIG_HOME}/starship.toml"

cd "${DOTFILES_ROOT}/.hammerspoon" && find . -name "*.lua" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/.hammerspoon/{}" "${HOME}/.hammerspoon/{}"

[ -d "${HOME}/Library/Application Support/Code/User" ] && cd "${DOTFILES_ROOT}/vscode" && find . -name "*.json" | xargs -I {} ln -fnsv "${DOTFILES_ROOT}/vscode/{}" "${HOME}/Library/Application Support/Code/User/{}"

ln -fnsv "${DOTFILES_ROOT}/.zshrc" "${HOME}/.zshrc"
ln -fnsv "${DOTFILES_ROOT}/.vimrc" "${HOME}/.vimrc"
