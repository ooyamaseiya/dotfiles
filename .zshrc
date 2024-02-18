export KREW_PATH="${KREW_ROOT:-$HOME/.krew}/bin"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PATH:$PYENV_ROOT:$KREW_PATH"

eval "$(pyenv init -)"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# シンタックスハイライト
zinit light zdharma/fast-syntax-highlighting

# Ctrl+r でコマンド履歴を検索
zinit light zdharma/history-search-multi-word

ENHANCD_FILTER="fzf --height 50% --preview 'eza --tree --git-ignore --level 1 --only-dirs --color=always {}':fzy"
ENHANCD_HOOK_AFTER_CD=ls
zinit ice wait'!0'; zinit light babarot/enhancd

# For kubectl autocompletion
autoload -Uz compinit
compinit

setopt auto_cd
function chpwd() { ls -G --color=always }

# 補完
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light chrissicool/zsh-256color

alias ls='ls -G --color=always'
alias ll='ls -lh --color=always'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias exa='eza --tree --level 1 --color=always'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

_notify-done() {
　　osascript -e 'display notification "Process is done!" with title "iTerm2"'
}
alias notify-done=_notify-done

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ooyamaseiya/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ooyamaseiya/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ooyamaseiya/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ooyamaseiya/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source <(kubectl completion zsh)


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
