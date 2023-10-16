# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use vim keybindings
bindkey -v
bindkey -s ññ '\e'
bindkey ññ vi-cmd-mode

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

export EDITOR="/usr/bin/vim"
export TMPDIR="/tmp"

# load fzf
if type fzf >/dev/null; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
if type bat >/dev/null; then
    alias catn=/usr/bin/cat
    alias cat=bat
fi
if type nvim >/dev/null; then
    alias v=nvim
fi
if type lsd >/dev/null; then
    alias l='lsd --group-dirs=first'
    alias ls='l'
    alias ll='l -l'
    alias la='l -a'
    alias lla='l -la'
fi
alias ..='goBackTo'
alias tp='teleport'
alias atp='add_teleport'
alias ltp='list_teleport'
alias dtp='del_teleport'

# Go back in your steps (directories) 
function goBackTo {
    local dirname=${1:-'..'}
    dirname=$(pwd | grep -o ".*${dirname}/")
    cd $dirname
}

# Navegate to favorite directories
tplist=$HOME/.teleport
function teleport {
    local directories=($(cat $tplist))
    selection=$(echo ${directories[@]} | tr ' ' '\n' | fzf)
    if [ -n "$selection" ]; then
        cd $selection
    fi
}
function add_teleport {
    directories+=($(pwd))
    echo ${directories[@]} > $tplist
}
function list_teleport {
    local directories=($(cat $tplist))
    echo ${directories[@]}
}
function del_teleport {
    local directories=($(cat $tplist))
    selection=$(echo ${directories[@]} | tr ' ' '\n' | fzf)
    if [ -n "$selection" ]; then
        directories=(${directories[@]/$selection})
        echo ${directories[@]} > $tplist
    fi
    directories=($(cat $tplist))
}


# completions
function list_dirs {
    echo $(pwd) | awk -F/ '{ for(i=1; i<=NF; i++) print $i }'
}

complete -F list_dirs goBackTo

# aws 
# profile switcher
alias awsp='export AWS_PROFILE=$(sed -n "s/\[profile \(.*\)\]/\1/gp" ~/.aws/config | fzf)'
# local
alias awslocal='aws --endpoint-url=http://localhost:4566'

# load ssh-keys
eval $(ssh-agent -s) > /dev/null 2>&1
ssh-add > /dev/null 2>&1
