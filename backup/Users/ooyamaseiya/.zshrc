export KREW_PATH="${KREW_ROOT:-$HOME/.krew}/bin"
export PATH="$PATH:$PYENV_ROOT:$KREW_PATH"

XDG_CONFIG_HOME=~/.config
ENHANCD_FILTER="fzf --height 50% --preview 'eza --tree --git-ignore --level 1 --only-dirs --color=always {}':fzy"

# For kubectl autocompletion
autoload -Uz compinit
compinit

# History size extends
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=1000000

# All sessions share histories
setopt inc_append_history
setopt share_history

setopt auto_cd
function chpwd() { eza -G --group-directories-first --color=always }

# Zsh changes keybind vim mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# Node.js version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv configs
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

eval "$(starship init zsh)"
eval "$(sheldon source)"
source <(kubectl completion zsh)
